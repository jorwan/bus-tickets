import 'iticket.dart';
import 'ivalidatable.dart';
import 'ticket.dart';

class TicketHasNotBeenUsedValidator implements IValidatable {
  List<Ticket> _tickets;
  IValidatable _validator;
  ITicket _ticket;

  @override
  TicketHasNotBeenUsedValidator(this._ticket, this._tickets,
      {IValidatable validator}) {
    _validator = validator ?? Validatable();
  }

  @override
  bool valid() {
    bool hasNotBeenUsed = true;
    if (_ticket != null) {
      for (final ticket in _tickets ?? []) {
        // If ticket exists then it has been used
        if (ticket.token == _ticket.token) {
          hasNotBeenUsed = false;
          break;
        }
      }
    }
    return hasNotBeenUsed && _validator.valid();
  }
}
