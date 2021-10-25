const sendHttpRequest = require('sendHttpRequest');
const getAllEventData = require('getAllEventData');
const makeInteger = require('makeInteger');
const makeTableMap = require('makeTableMap');
const JSON = require('JSON');

const postHeaders = {'Content-Type': 'application/json'};
let postBodyData = {};

if (data.includeEventData) {
    postBodyData = getAllEventData();
}

if (data.headers) {
    for (let key in data.headers) {
        postHeaders[data.headers[key].key] = data.headers[key].value;
    }
}

if (data.data) {
    let postBodyCustomData = data.simple_object ? createSimpleObject() : createNestedObject();

    for (let key in postBodyCustomData) {
        postBodyData[key] = postBodyCustomData[key];
    }
}

if (data.flatten) {
    postBodyData = escapeKeys(flatten(postBodyData));
}

if (data.inside_array) {
    postBodyData = [postBodyData];
}

const postBody = JSON.stringify(postBodyData);
let requestOptions = {headers: postHeaders, method: data.requestMethod};

if (data.requestTimeout) {
    requestOptions.timeout = makeInteger(data.requestTimeout);
}

sendHttpRequest(data.url, (statusCode, headers, body) => {
    if (statusCode >= 200 && statusCode < 300) {
        data.gtmOnSuccess();
    } else {
        data.gtmOnFailure();
    }
}, requestOptions, postBody);


function escapeKeys(ob) {
    var toReturn = {};

    for (let key in ob) {
        let newKey = key.split("-").join("_");

        toReturn[newKey] = ob[key];
    }

    return toReturn;
}

function flatten(ob) {
    var toReturn = {};

    for (let i in ob) {
        if (!ob.hasOwnProperty(i)) continue;

        if ((typeof ob[i]) == 'object') {
            var flatObject = flatten(ob[i]);
            for (var x in flatObject) {
                if (!flatObject.hasOwnProperty(x)) continue;

                toReturn[i + '_' + x] = flatObject[x];
            }
        } else {
            toReturn[i] = ob[i];
        }
    }
    return toReturn;
}

function createSimpleObject() {
    return makeTableMap(data.data, 'key', 'value');
}


function mergeObjects() {
    let obj = {},
        i = 0,
        il = arguments.length,
        key;
    for (; i < il; i++) {
        for (key in arguments[i]) {
            if (arguments[i][key]) {
                obj[key] = arguments[i][key];
            }
        }
    }
    return obj;
}

function createNestedObject() {
    let object = {};

    for (let key in data.data) {
        let dotPath = data.data[key].key;
        let rootProperty = dotPath.split('.')[0];
        let strObj = strToObj(dotPath, data.data[key].value)[rootProperty];

        if (object[rootProperty]) {
            object[rootProperty] = mergeObjects(object[rootProperty], strObj);
        } else {
            object[rootProperty] = strObj;
        }
    }

    return object;
}

function strToObj(dotPath, val) {
    let i, obj = {}, dotArr = dotPath.split('.');
    let x = obj;

    for (i = 0; i < dotArr.length - 1; i++) {
        x = x[dotArr[i]] = {};
    }

    x[dotArr[i]] = val;

    return obj;
}

