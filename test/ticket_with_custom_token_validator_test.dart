import 'package:bus_ticket_app/src/ticket.dart';
import 'package:bus_ticket_app/src/ticket_generated_from_mobile_app_validator.dart';
import 'package:bus_ticket_app/src/ticket_holder.dart';
import 'package:bus_ticket_app/src/ticket_provider.dart';
import 'package:bus_ticket_app/src/token_builder.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Provider Token Validations: ', () {
    test('Ticket with correct provider token must pass validation', () {
      /**
        * Arrange
        */
      final faker = Faker();
      final customSecretKey = faker.randomGenerator.string(20);
      final selectedDateT1 = faker.date.dateTime();
      final ticketId = faker.guid.guid();
      final holderId = faker.guid.guid();
      final holderName = faker.person.name();
      final providerId = faker.guid.guid();
      final providerName = faker.person.name();

      Ticket t1 = Ticket(
        id: ticketId,
        createdAt: selectedDateT1,
        holder: TicketHolder(id: holderId, name: holderName),
        provider: TicketProvider(id: providerId, name: providerName),
      );
      t1.token = TicketTokenBuilder(t1, providerToken: customSecretKey).build();

      final result = TicketGeneratedFromMobileAppValidator(t1,
              tokenBuilder:
                  TicketTokenBuilder(t1, providerToken: customSecretKey))
          .valid();
      /**
       * Act
       */

      /**
       * Assert
       */
      expect(result, true);
    });
    test('Ticket with incorrect provider token must not pass validation', () {
      /**
        * Arrange
        */
      final faker = Faker();
      final customSecretKey = faker.randomGenerator.string(20);
      final selectedDateT1 = faker.date.dateTime();
      final ticketId = faker.guid.guid();
      final holderId = faker.guid.guid();
      final holderName = faker.person.name();
      final providerId = faker.guid.guid();
      final providerName = faker.person.name();

      Ticket t1 = Ticket(
        id: ticketId,
        createdAt: selectedDateT1,
        holder: TicketHolder(id: holderId, name: holderName),
        provider: TicketProvider(id: providerId, name: providerName),
      );
      t1.token = TicketTokenBuilder(t1)
          .build(); // Build token WITHOUT USING provider token

      // Build a token USING the provider token
      final generatedToken =
          TicketTokenBuilder(t1, providerToken: customSecretKey).build();

      /**
       * Act
       */

      /**
       * Assert
       */
      expect(t1.token, isNot(equals(generatedToken)));
    });
  });
}
