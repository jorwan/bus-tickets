import 'package:bus_ticket_app/src/i_io_secure_message.dart';
import 'package:bus_ticket_app/src/io_secure_message.dart';
import 'package:bus_ticket_app/src/io_ticket_message.dart';
import 'package:bus_ticket_app/src/ticket_json_decoder.dart';
import 'package:bus_ticket_app/src/ticket.dart';
import 'package:bus_ticket_app/src/ticket_json_encoder.dart';
import 'package:bus_ticket_app/src/ticket_holder.dart';
import 'package:bus_ticket_app/src/ticket_provider.dart';
import 'package:bus_ticket_app/src/token_builder.dart';
import 'package:faker/faker.dart';
import 'package:test/test.dart';

void main() {
  // test('description', () {
  /**
     * Arrange
     */

  /**
     * Act
     */

  /**
     * Assert
     */
  // });

  test('Create two empty ticket generate same token', () {
    /**
     * Arrange
     */
    Ticket t1 = Ticket();
    Ticket t2 = Ticket();
    t1.token = TicketTokenBuilder(t1).build();
    t2.token = TicketTokenBuilder(t1).build();
    /**
     * Act
     */
    print('t1.token: ${t1.token}');
    print('t2.token: ${t2.token}');

    /**
     * Assert
     */
    expect(t1.token, t2.token);
  });

  /**
   * Encode empty ticket many times will be equals as first time of encode
   */
  test('Encode empty ticket many times will be equals as first time of encode',
      () {
    /**
     * Arrange
     */
    // Create ticket
    final t1 = Ticket();
    // Encode ticket
    final encT1 = TicketJsonEncoder(ticket: t1).encode();
    // Decode encoded-ticket
    final decT1 = TicketJsonDecoder(ticketJson: encT1).decode();
    // Encode decoded-encoded-ticket
    final encT2 = TicketJsonEncoder(ticket: decT1).encode();

    /**
     * Act
     */

    /**
     * Assert
     */
    expect(encT1, encT2);
  });

  /**
   * Encode non-empty ticket many times will be equals as first time of encode
   */
  test(
      'Encode non-empty ticket many times will be equals as first time of encode',
      () {
    /**
     * Arrange
     */
    // Create ticket holder
    final holderId = faker.guid.guid();
    final holderName = faker.person.name();
    final holder = TicketHolder(id: holderId, name: holderName);
    // Create ticket provider
    final providerId = faker.guid.guid();
    final providerName = faker.person.name();
    final provider = TicketProvider(id: providerId, name: providerName);
    // Create ticket
    final ticketId = faker.guid.guid();
    final selectedDate = faker.date.dateTime();
    final t1 = Ticket(
      id: ticketId,
      createdAt: selectedDate,
      provider: provider,
      holder: holder,
    );
    // Generate token
    final customSecretKey = faker.randomGenerator.string(20);
    t1.token = TicketTokenBuilder(t1, providerToken: customSecretKey).build();
    // Encode ticket
    final encT1 = TicketJsonEncoder(ticket: t1).encode();
    // Decode encoded-ticket
    final decT1 = TicketJsonDecoder(ticketJson: encT1).decode();
    // Encode decoded-encoded-ticket
    final encT2 = TicketJsonEncoder(ticket: decT1).encode();

    /**
     * Act
     */
    print(encT1);
    print(encT2);

    /**
     * Assert
     */
    expect(encT1, encT2);
  });
}
