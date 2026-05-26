___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "JSON HTTP request",
  "categories": [
    "UTILITY",
    "DATA_WAREHOUSING"
  ],
  "brand": {
    "displayName": "stape-io",
    "thumbnail": "data:image/jpeg;base64,iVBORw0KGgoAAAANSUhEUgAAAUUAAAE3AgMAAABA8LsEAAAABGdBTUEAALGPC/xhBQAAAAxQTFRFAAAAAAAAAAAAAAAANek3lgAAAAN0Uk5TuloAcusKxgAABQ5JREFUeNrt3T1u20gUB3DlBKmSwkfQJWggB7CBhbdwsz0vQd+Axe7WLKhAolz4CNkUUaEj6AipIhYqDMpv/RWZM5yP9x71txNgprSFH0YiORq+Gf05WfrbvxcXor8/tauJ7z+fzzMiyl3/Ku7/8e5PMXlOj81LEn3NRWRzRlGSuksB2bwnBkndCZs89DFCuvvpJP8gJknbnEfOiE3SikU2hYCkEw75N0nILYNsMhE57OaQNDrJILdxshCSg5cMyBlJyVWMLMVkFyHNg8Mi7QNkk9b7ZpGrMFkpyH2YLBSk9SKLbEhDbkJkrSLbEFmqyC5EZiqSpn5y8FEyyY2fnCvJnZ+slWTrJ0sl2fnJQkkaLzNJ0pLffeRCTa595FxN7nxkrSZbH1mpyb2PLNVk5yMLNdl/nUFmenLqIYev/M9JnlLoxOyTg3Hox6Vn1t18CoxFfdI+078Fbhv+8Z/rffLafNV2GWrm1Ilu3aR58XR5kFye+S6fPlkHpzrL4OSpdZM3kk5a3bxzk5Wkk1Y3926y9H7puVvmviL75Bf24XYc9Di5YpCzOFnI3rf5znMnmflntu5WOvvgIVsWWUdJz9eTvy2cQ5GH3LDIJkY2sZE3OBZvIiTv6BjHJ0bumWTFJ1smWUfIhWe+GGhz1zniJm+Z5DWfXDPJRYS8ds/tgs31xtzklEtmb0nmXLJ4S5Ir9r4IXp/s2GSZyEQmMpGJTGQiE5nIRCYykShyPorcJbJH1uKaTr+q04ZJTS+d5M2oXt65yGoUuX8lsnQVySPtxvH598hiFPlSD+mRmbiKZ9Txpg6SxpHfh6SiMOguDb6Q1yPJ2yFZy2uNRj/aIVnJa43Gp7UfkqW0BO4rSb+Q2UjycBYdyIYUFVFnef9AzklRvjTe284mK1LUGo36/94mC1IUBs1lp9wkGyLFoG4u+WxMsiZSDJfm59Wa5BlpRg2zK89Ll8/kzLv9hH+R/1zDeyb/8iz5Si7yn5/YE/k5I9JcPPaa+scD2ZzRccjHLZ6P5DljfwHjXH/eMns1aS4mFNxdxz8xHzYnfLi8mpy+p+C2NcGJ+dihyekkvN9IdGI+NQe5FpELDrkRkQ2HFB1wx1aTISk74I69OEOyFZJ1nFwJyVmcPBGS9r7SIdkJj469zcRBbqWivRtmSK7F5CJGTsWkvVnKJvdy0R45bHKlIGdhMleQ1jVpkTuNaO1tssgTFWme7SbZLnWtetVeIj5LwBFHnJeAqwdwjSNGIsB4CRjVAd89iG9IwPc4YLYBmBMhZm7rcUeHILPgI8/V6X6uDrijANz3YO7OAPeQiDtdxP24MejdCcgbb9UAUdsAVGAAdSJENQtQcwNUBgH1S0SVFVALBlSsAXV1QPUfsEaBWEkBrPcAVqXKUWtnThKwHAdYhwSslgLWdNOS+/HItBUkkYlMZCITmchEJjKRiUzkL0r+Hj9X/U1++ssuYL7pz6jZNdHI78cBv3LH/hb/WIkBgFwDbPoCICPiWEkWgLwNRCoIILsEkLACyIEBpNUAMnUAyT+AfCJAihIg6wmQSAXIzQKkewEyyABJaYg8t0JP5h4SkI1XqUlvgh8gZxCQhgjIbAQkSyLyLwEpnYAsUUDiKSCXFZAei8i4BSTxAvKCAanGiOxlQEI0IMcakLaNyAQHJJcj8tUBKfCArHqzm1HykkMCcv8RTydAPEMB8KQHxPMoloCnZiwRz/Z4aMonkPwPT2Ue+QxrakIAAAAASUVORK5CYII\u003d",
    "id": "github.com_stape-io"
  },
  "description": "Send POST request, to your URL, with JSON body and desired headers.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "url",
    "displayName": "Destination URL",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "valueHint": "https://"
  },
  {
    "type": "CHECKBOX",
    "name": "includeEventData",
    "checkboxText": "Include all Event Data in the request body",
    "simpleValueType": true,
    "help": "If checked, all the Event Data values will be added to the request body."
  },
  {
    "type": "CHECKBOX",
    "name": "simple_object",
    "checkboxText": "Do not use dot notation",
    "simpleValueType": true,
    "help": "By default, you can use dot notation to create a nested request object. \nBut in case you need to create a property that contains a dot then you can use this option for that."
  },
  {
    "type": "CHECKBOX",
    "name": "inside_array",
    "checkboxText": "Put the request object inside an array",
    "simpleValueType": true
  },
  {
    "type": "CHECKBOX",
    "name": "useOptimisticScenario",
    "checkboxText": "Use Optimistic Scenario",
    "simpleValueType": true,
    "help": "The tag will call gtmOnSuccess() without waiting for a response from the API. This will speed up sGTM response time however your tag will always return the status fired successfully even in case it is not."
  },
  {
    "type": "GROUP",
    "name": "requestData",
    "displayName": "Request Data",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "LABEL",
        "name": "start",
        "displayName": "{"
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "data",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Property",
            "name": "key",
            "type": "TEXT",
            "isUnique": true
          },
          {
            "defaultValue": "",
            "displayName": "Value",
            "name": "value",
            "type": "TEXT"
          }
        ],
        "newRowButtonText": "Add Value"
      },
      {
        "type": "LABEL",
        "name": "end",
        "displayName": "}"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "requestHeaders",
    "displayName": "Request Headers",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "SIMPLE_TABLE",
        "name": "headers",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Key",
            "name": "key",
            "type": "TEXT",
            "isUnique": true
          },
          {
            "defaultValue": "",
            "displayName": "Value",
            "name": "value",
            "type": "TEXT"
          }
        ],
        "newRowButtonText": "Add Header"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "additionalOption",
    "displayName": "Additional Options",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "SELECT",
        "name": "requestMethod",
        "displayName": "Request Method",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "POST",
            "displayValue": "POST"
          },
          {
            "value": "PUT",
            "displayValue": "PUT"
          },
          {
            "value": "PATCH",
            "displayValue": "PATCH"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "POST",
        "valueValidators": [
          {
            "type": "REGEX",
            "args": [
              "POST|PUT|PATCH"
            ]
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "requestTimeout",
        "displayName": "Request Timeout",
        "simpleValueType": true,
        "defaultValue": 3000,
        "valueValidators": [
          {
            "type": "NON_NEGATIVE_NUMBER"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "flatten",
        "checkboxText": "Use flatten keys",
        "simpleValueType": true,
        "help": "If checked, all nested objects will be transformed it into a single-level object, with their keys joined with an underscore (\"_\").\n\u003cbr/\u003e\nAny hyphens (\"-\") that might exist in the original keys will also be replaced with an underscore (\"_\")."
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

const getAllEventData = require('getAllEventData');
const getRequestHeader = require('getRequestHeader');
const getType = require('getType');
const JSON = require('JSON');
const makeInteger = require('makeInteger');
const makeTableMap = require('makeTableMap');
const sendHttpRequest = require('sendHttpRequest');

/*==============================================================================
==============================================================================*/

const eventData = getAllEventData();

const url = getUrl(eventData);
if (url && url.lastIndexOf('https://gtm-msr.appspot.com/', 0) === 0) {
  return data.gtmOnSuccess();
}

const postHeaders = { 'Content-Type': 'application/json' };
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
  const postBodyCustomData = data.simple_object ? createSimpleObject() : createNestedObject();

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
const requestOptions = { headers: postHeaders, method: data.requestMethod };

if (data.requestTimeout) {
  requestOptions.timeout = makeInteger(data.requestTimeout);
}

sendHttpRequest(
  data.url,
  (statusCode, headers, body) => {
    if (!data.useOptimisticScenario) {
      if (statusCode >= 200 && statusCode < 300) data.gtmOnSuccess();
      else data.gtmOnFailure();
    }
  },
  requestOptions,
  postBody
);

if (data.useOptimisticScenario) {
  return data.gtmOnSuccess();
}

/*==============================================================================
  Vendor related functions
==============================================================================*/

function escapeKeys(ob) {
  const toReturn = {};

  for (let key in ob) {
    const newKey = key.split('-').join('_');
    toReturn[newKey] = ob[key];
  }

  return toReturn;
}

function flatten(ob) {
  const toReturn = {};

  for (let i in ob) {
    if (!ob.hasOwnProperty(i)) continue;

    if (getType(ob[i]) === 'object') {
      const flatObject = flatten(ob[i]);
      for (let x in flatObject) {
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

function createNestedObject() {
  const result = {};

  data.data.forEach((item) => {
    const path = item.key.split('.');
    path.reduce((acc, key, index) => {
      const isLastKey = index === path.length - 1;
      if (isLastKey) acc[key] = item.value;
      else acc[key] = acc[key] || {};
      return acc[key];
    }, result);
  });

  return result;
}

/*==============================================================================
  Helpers
==============================================================================*/

function getUrl(eventData) {
  return eventData.page_location || eventData.page_referrer || getRequestHeader('referer');
}


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_http",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_request",
        "versionId": "1"
      },
      "param": [
        {
          "key": "headerWhitelist",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "referer"
                  }
                ]
              }
            ]
          }
        },
        {
          "key": "headersAllowed",
          "value": {
            "type": 8,
            "boolean": true
          }
        },
        {
          "key": "requestAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "headerAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "queryParameterAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Check semantical errors
  code: |-
    const mockData = {
      url: "https://httpbin.org/anything",
      custom: {
        header: {},
        data: {}
      }
    };

    // Call runCode to run the template's code.
    runCode(mockData);


___NOTES___

2026-05-25 Change Notes:
 - Logging removal.

Created on 29/10/2020, 16:18:11

