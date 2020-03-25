import 'ito_str_ticket_maker.dart';

class ToStrTicketMaker implements IToStrTicketMaker {
  @override
  List<dynamic> data;

  ToStrTicketMaker(List<dynamic> values) {
    this.data = values;
  }

  @override
  String toString() => this.data.toString();
}
