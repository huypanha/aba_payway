import 'dart:convert';
import 'dart:typed_data';

import 'package:basic_utils/basic_utils.dart';
import 'package:pointycastle/export.dart';

String opensslEncrypt(Map<String, dynamic> data, String publicKey) {
  final pubKey = CryptoUtils.rsaPublicKeyFromPem(publicKey);
  final cipher = PKCS1Encoding(RSAEngine())..init(true, PublicKeyParameter<RSAPublicKey>(pubKey));
  final input = Uint8List.fromList(utf8.encode(jsonEncode(data)));
  final output = BytesBuilder();
  final maxChunkSize = cipher.inputBlockSize;

  for (var offset = 0; offset < input.length; offset += maxChunkSize) {
    final end = (offset + maxChunkSize < input.length) ? offset + maxChunkSize : input.length;
    final chunk = input.sublist(offset, end);
    final encryptedChunk = cipher.process(chunk);
    output.add(encryptedChunk);
  }

  return base64Encode(output.toBytes());
}

Map<String, dynamic>? opensslDecrypt({required String base64, required String privateKey}) {
  final priKey = CryptoUtils.rsaPrivateKeyFromPem(privateKey);
  final cipher = PKCS1Encoding(RSAEngine())..init(false, PrivateKeyParameter<RSAPrivateKey>(priKey));
  final encryptedBytes = base64Decode(base64);
  final output = BytesBuilder();
  final chunkSize = priKey.modulus!.bitLength ~/ 8;

  for (var offset = 0; offset < encryptedBytes.length; offset += chunkSize) {
    final end = (offset + chunkSize < encryptedBytes.length) ? offset + chunkSize : encryptedBytes.length;
    final chunk = encryptedBytes.sublist(offset, end);
    final decryptedChunk = cipher.process(Uint8List.fromList(chunk));
    output.add(decryptedChunk);
  }

  return jsonDecode(utf8.decode(output.toBytes()));
}
