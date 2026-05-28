import 'package:dio/dio.dart';

import 'aba_payway_exception.dart';

ABAPaywayException errorParser(Response response) {
  String message = 'ABA Payway API error';
  String errorCode = '';
  if (response.data is Map) {
    final status = Map.from(response.data)['status'];
    message = status['message']?.toString() ?? message;
    errorCode = status['code']?.toString() ?? errorCode;
  }
  return ABAPaywayException(statusCode: response.statusCode ?? 500, errorCode: errorCode, message: message, response: response.data);
}
