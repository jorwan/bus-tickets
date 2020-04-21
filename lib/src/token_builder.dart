import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'itoken_builder.dart';

class TokenBuilder implements ITokenBuilder {
  String salt;

  TokenBuilder({this.salt}) {
    this.salt ??= '';
  }

  @override
  String build(String data) {
    var key =
        utf8.encode(ITokenBuilder.SECRET_TOKEN_BUILDER + this.salt);
    var bytes = utf8.encode(data);

    var hmacSha256 = new Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);

    // print("HMAC digest as bytes: ${digest.bytes}");
    // print("HMAC digest as hex string: $digest");

    return '$digest';
  }
}
