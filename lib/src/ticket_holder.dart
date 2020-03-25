import 'iticket_holder.dart';

class TicketHolder implements ITicketHolder {
  @override
  int id;

  @override
  String name;

  TicketHolder({this.id, this.name});

  @override
  String toString() => [id, name].toString();
}
