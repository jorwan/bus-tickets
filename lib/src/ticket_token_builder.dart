import 'package:bus_ticket_app/src/iticket.dart';
import 'package:bus_ticket_app/src/iticket_token_builder.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class TicketTokenBuilder implements ITicketTokenBuilder {
  @override
  String build(ITicket ticket) => _encryptData(ticket.toString());

  String _encryptData(String data) {
    var key = utf8.encode(ITicketTokenBuilder.SECRET_TOKEN_BUILDER);
    var bytes = utf8.encode(data);

    var hmacSha256 = new Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);

    // print("HMAC digest as bytes: ${digest.bytes}");
    // print("HMAC digest as hex string: $digest");

    return '$digest';
  }
}
