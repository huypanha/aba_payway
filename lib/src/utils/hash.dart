import 'dart:convert';

import 'package:crypto/crypto.dart';

/// Generates a hash.
String generateHash({required String data, required String partnerId, Hash hash = sha256}) {
  final hmac = Hmac(hash, utf8.encode(partnerId));
  final digest = hmac.convert(utf8.encode(data));
  return base64Encode(digest.bytes);
}
