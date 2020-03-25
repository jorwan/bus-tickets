import 'iticket_holder.dart';
import 'iticket_provider.dart';
import 'iticket_token_builder.dart';
import 'ito_str_ticket_maker.dart';

abstract class ITicket {
  String id;
  /**
   * Used to valid that this ticket is generated from mobile app
   */
  String token;
  /**
   * Generate ticket's token
   */
  ITicketTokenBuilder tokenBuilder;
  /**
   * Ticket created date
   */
  DateTime createdAt;
  /**
   * Ticket Provider
   */
  ITicketProvider provider;
  /**
   * Addressed to or owner of ticket
   */
  ITicketHolder holder;

  /**
   * to-string ticket maker 
   */
  IToStrTicketMaker toStrTicketMaker;
}
