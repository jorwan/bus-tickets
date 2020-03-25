import 'package:bus_ticket_app/src/iticket_provider.dart';

class TicketProvider implements ITicketProvider {
  @override
  int id;

  @override
  String name;

  TicketProvider({this.id, this.name});

  @override
  String toString() => [id, name].toString();
}
