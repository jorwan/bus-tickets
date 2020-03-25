import 'package:bus_ticket_app/src/iticket.dart';
import 'package:bus_ticket_app/src/iticket_token_builder.dart';
import 'package:bus_ticket_app/src/ivalidatable.dart';
import 'package:bus_ticket_app/src/ticket_token_builder.dart';

class TicketGeneratedFromMobileAppValidator implements IValidatable {
  @override
  ITicketTokenBuilder _tokenBuilder;
  ITicket _ticket;
  IValidatable _validator;

  TicketGeneratedFromMobileAppValidator(ITicket ticket,
      {ITicketTokenBuilder tokenBuilder, IValidatable validator}) {
    _tokenBuilder = tokenBuilder ?? TicketTokenBuilder();
    _ticket = ticket;
    _validator = validator ?? Validatable();
  }

  @override
  bool valid() =>
      _ticket != null &&
      _ticket.token == _tokenBuilder.build(_ticket) &&
      _validator.valid();
}
