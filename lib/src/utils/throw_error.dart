import 'package:dio/dio.dart';

import 'exception.dart';

ABAException errorParserResponse(Response response) {
  String message = 'ABA Payway API error';
  String errorCode = '';
  if (response.data is Map) {
    final status = Map.from(response.data)['status'];
    message = status['message']?.toString() ?? message;
    errorCode = status['code']?.toString() ?? errorCode;
  }
  return ABAException(statusCode: response.statusCode ?? 500, errorCode: errorCode, message: message, response: response.data);
}
