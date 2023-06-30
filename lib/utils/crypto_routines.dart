import 'dart:convert';
import 'package:crypto/crypto.dart';

class CryptoRoutines {
  static String getSecureHash(String cleartext) {
    return sha256.convert(utf8.encode(cleartext)).toString();
  }

  static bool secureCompare(String hash, String cleartext) {
    if (hash == sha256.convert(utf8.encode(cleartext)).toString()) {
      return true;
    }
    return false;
  }
}
