const BigQuery = require('BigQuery');
const getAllEventData = require('getAllEventData');
const getContainerVersion = require('getContainerVersion');
const getRequestHeader = require('getRequestHeader');
const getTimestampMillis = require('getTimestampMillis');
const getType = require('getType');
const JSON = require('JSON');
const logToConsole = require('logToConsole');
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

log({
  Name: 'JsonRequest',
  Type: 'Request',
  RequestMethod: data.requestMethod,
  RequestUrl: data.url,
  RequestBody: postBodyData
});

sendHttpRequest(
  data.url,
  (statusCode, headers, body) => {
    log({
      Name: 'JsonRequest',
      Type: 'Response',
      ResponseStatusCode: statusCode,
      ResponseHeaders: headers,
      ResponseBody: body
    });

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

function log(rawDataToLog) {
  const logDestinationsHandlers = {};
  if (determinateIsLoggingEnabled()) logDestinationsHandlers.console = logConsole;
  if (determinateIsLoggingEnabledForBigQuery()) logDestinationsHandlers.bigQuery = logToBigQuery;

  rawDataToLog.TraceId = getRequestHeader('trace-id');

  const keyMappings = {
    // No transformation for Console is needed.
    bigQuery: {
      Name: 'tag_name',
      Type: 'type',
      TraceId: 'trace_id',
      EventName: 'event_name',
      RequestMethod: 'request_method',
      RequestUrl: 'request_url',
      RequestBody: 'request_body',
      ResponseStatusCode: 'response_status_code',
      ResponseHeaders: 'response_headers',
      ResponseBody: 'response_body'
    }
  };

  for (const logDestination in logDestinationsHandlers) {
    const handler = logDestinationsHandlers[logDestination];
    if (!handler) continue;

    const mapping = keyMappings[logDestination];
    const dataToLog = mapping ? {} : rawDataToLog;

    if (mapping) {
      for (const key in rawDataToLog) {
        const mappedKey = mapping[key] || key;
        dataToLog[mappedKey] = rawDataToLog[key];
      }
    }

    handler(dataToLog);
  }
}

function logConsole(dataToLog) {
  logToConsole(JSON.stringify(dataToLog));
}

function logToBigQuery(dataToLog) {
  const connectionInfo = {
    projectId: data.logBigQueryProjectId,
    datasetId: data.logBigQueryDatasetId,
    tableId: data.logBigQueryTableId
  };

  dataToLog.timestamp = getTimestampMillis();

  ['request_body', 'response_headers', 'response_body'].forEach((p) => {
    dataToLog[p] = JSON.stringify(dataToLog[p]);
  });

  BigQuery.insert(connectionInfo, [dataToLog], { ignoreUnknownValues: true });
}

function determinateIsLoggingEnabled() {
  const containerVersion = getContainerVersion();
  const isDebug = !!(
    containerVersion &&
    (containerVersion.debugMode || containerVersion.previewMode)
  );

  if (!data.logType) {
    return isDebug;
  }

  if (data.logType === 'no') {
    return false;
  }

  if (data.logType === 'debug') {
    return isDebug;
  }

  return data.logType === 'always';
}

function determinateIsLoggingEnabledForBigQuery() {
  if (data.bigQueryLogType === 'no') return false;
  return data.bigQueryLogType === 'always';
}
