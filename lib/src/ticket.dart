import 'package:uuid/uuid.dart';

import 'iticket.dart';
import 'iticket_holder.dart';
import 'iticket_provider.dart';
import 'iticket_token_builder.dart';
import 'ito_str_ticket_maker.dart';
import 'ticket_holder.dart';
import 'ticket_provider.dart';
import 'ticket_token_builder.dart';
import 'to_str_ticket_maker.dart';

class Ticket implements ITicket {
  @override
  String id;

  @override
  String token;

  @override
  ITicketTokenBuilder tokenBuilder;

  @override
  DateTime createdAt;

  @override
  ITicketProvider provider;

  @override
  ITicketHolder holder;

  /**
   * Constructor
   */
  Ticket(
      {String id,
      String token,
      this.tokenBuilder,
      DateTime createdAt,
      TicketProvider provider,
      TicketHolder holder,
      this.toStrTicketMaker}) {
    this.id = id ?? Uuid().v4();
    this.tokenBuilder ??= TicketTokenBuilder();
    this.createdAt = createdAt;
    this.provider = provider;
    this.holder = holder;
    this.toStrTicketMaker ??= ToStrTicketMaker([
      id,
      token,
      createdAt,
      provider,
      holder,
    ]);

    this.token = token ?? this.tokenBuilder.build(this);
  }

  @override
  String toString() => toStrTicketMaker.toString();

  @override
  IToStrTicketMaker toStrTicketMaker;
}
