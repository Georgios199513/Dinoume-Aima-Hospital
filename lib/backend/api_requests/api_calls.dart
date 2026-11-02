import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SendVerificationCodeCall {
  static Future<ApiCallResponse> call({
    String? to = 'grigoriadis.georges@gmail.com',
    String? subject = 'Test',
    String? templateID = 'Ap5OQeDxxBtjY6CBuvW2',
    String? medium = 'email',
    String? verificationCode = 'test',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Send Verification Code',
      apiUrl: 'https://api.abracadalo.com/notification/send',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'BNpmrJGOjZHxFXXyqqVN',
      },
      params: {
        'to': to,
        'subject': subject,
        'templateID': templateID,
        'medium': medium,
        'verificationCode': verificationCode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetLatLngFromAddressCall {
  static Future<ApiCallResponse> call({
    String? address = 'Ακαδημίας 76, Αθήνα 106 79',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get LatLng from address',
      apiUrl: 'https://maps.googleapis.com/maps/api/geocode/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'address': address,
        'key': "AIzaSyDpb5jPdh9I8DEWKOlhV5fMkrjrCZTTqZE",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic geometry(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location''',
      );
  static double? latidute(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
      ));
  static double? longitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
      ));
}

class SendWelcomeEmailNYACall {
  static Future<ApiCallResponse> call({
    String? to = 'grigoriadis.georges@gmail.com',
    String? name = 'Γιώργος',
    String? subject = 'Welcome',
    String? hospitalShortName = 'E.KE.A.',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Send Welcome Email NYA',
      apiUrl: 'https://api.abracadalo.com/notification/send',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'BNpmrJGOjZHxFXXyqqVN',
      },
      params: {
        'to': to,
        'subject': subject,
        'templateID': "eEdccQQyigufmwwzfhaD",
        'medium': "email",
        'name': name,
        'hospitalShortName': hospitalShortName,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelScheduledEmailCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Cancel Scheduled Email',
      apiUrl: 'https://api.abracadalo.com/notification/cancel',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'BNpmrJGOjZHxFXXyqqVN',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendAppointmentModificationCall {
  static Future<ApiCallResponse> call({
    String? to = 'grigoriadis.georges@gmail.com',
    String? subject = 'Welcome',
    String? textBody = '',
    String? nameEvent = '',
    String? addressEvent = '',
    String? dateEvent = '',
    String? timeEvent = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Send Appointment Modification',
      apiUrl: 'https://api.abracadalo.com/notification/send',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'BNpmrJGOjZHxFXXyqqVN',
      },
      params: {
        'to': to,
        'subject': subject,
        'templateID': "qIYCEjigKy7nF3Sktdc7",
        'medium': "email",
        'textBody': textBody,
        'nameEvent': nameEvent,
        'addressEvent': addressEvent,
        'dateEvent': dateEvent,
        'timeEvent': timeEvent,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic success(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class SendGeneralEmailCall {
  static Future<ApiCallResponse> call({
    String? to = 'grigoriadis.georges@gmail.com',
    String? title = 'Γιώργος',
    String? subject = 'Welcome',
    String? body = 'Test',
    String? boldBody = 'BoldTest',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Send General Email',
      apiUrl: 'https://api.abracadalo.com/notification/send',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'BNpmrJGOjZHxFXXyqqVN',
      },
      params: {
        'to': to,
        'subject': subject,
        'templateID': "Ap5OQeDxxBtjY6CBuvW2",
        'medium': "email",
        'title': title,
        'body': body,
        'boldBody': boldBody,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendAppointmentCancellationCall {
  static Future<ApiCallResponse> call({
    String? to = 'grigoriadis.georges@gmail.com',
    String? subject = 'Welcome',
    String? textBody = '',
    String? nameEvent = '',
    String? addressEvent = '',
    String? dateEvent = '',
    String? timeEvent = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Send Appointment Cancellation',
      apiUrl: 'https://api.abracadalo.com/notification/send',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'BNpmrJGOjZHxFXXyqqVN',
      },
      params: {
        'to': to,
        'subject': subject,
        'templateID': "tbtYojbq4ndlXMQeiZHe",
        'medium': "email",
        'textBody': textBody,
        'nameEvent': nameEvent,
        'addressEvent': addressEvent,
        'dateEvent': dateEvent,
        'timeEvent': timeEvent,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
