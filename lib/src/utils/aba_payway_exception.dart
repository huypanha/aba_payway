class ABAPaywayException implements Exception {
  final int statusCode;
  final String errorCode;
  final String message;
  final Map<String, dynamic>? response;

  const ABAPaywayException({required this.statusCode, required this.errorCode, required this.message, this.response});

  @override
  String toString() {
    return 'ABAPaywayException($statusCode) [$errorCode]: $message';
  }
}
