import 'package:bus_ticket_app/src/iticket.dart';

abstract class ITicketTokenBuilder {
  String build(ITicket ticket);

  static const String SECRET_TOKEN_BUILDER =
      "b628c300-c9bb-49f3-b73d-a30996f84817";
}
