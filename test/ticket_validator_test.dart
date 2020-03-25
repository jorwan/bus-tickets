import 'package:bus_ticket_app/src/ivalidatable.dart';
import 'package:bus_ticket_app/src/ticket.dart';
import 'package:bus_ticket_app/src/ticket_generated_from_mobile_app_validator.dart';
import 'package:bus_ticket_app/src/ticket_has_not_been_used_validator.dart';
import 'package:bus_ticket_app/src/ticket_holder.dart';
import 'package:bus_ticket_app/src/ticket_matches_with_data_expected_validator.dart';
import 'package:bus_ticket_app/src/ticket_provider.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Ticket Validator:', () {
    test(
        'Ticket with generated-token without secret-token-builder must fail validation',
        () {
      /**
     * Arrange
     */
      final t1 = Ticket(token: 'hkjhqwe');
      final validator = TicketGeneratedFromMobileAppValidator(t1);

      /**
     * Act
     */

      /**
     * Assert
     */
      expect(validator.valid(), false);
    });

    test(
        'Ticket with generated-token with secret-token-builder must pass validation',
        () {
      /**
     * Arrange
     */
      final t1 = Ticket();
      final validator = TicketGeneratedFromMobileAppValidator(t1);

      /**
     * Act
     */

      /**
     * Assert
     */
      expect(validator.valid(), true);
    });

    test(
        'Ticket has not been used and with generated-token using secret-token-builder must pass validation',
        () {
      /**
     * Arrange
     */
      final t1 = Ticket();
      IValidatable validator = TicketHasNotBeenUsedValidator(t1, [],
          validator: TicketGeneratedFromMobileAppValidator(t1));

      /**
     * Act
     */

      /**
     * Assert
     */
      expect(validator.valid(), true);
    });

    test(
        'Ticket has been used and with generated-token using secret-token-builder must fail validation',
        () {
      /**
     * Arrange
     */
      final t1 = Ticket();
      IValidatable validator = TicketHasNotBeenUsedValidator(t1, [t1],
          validator: TicketGeneratedFromMobileAppValidator(t1));

      /**
     * Act
     */

      /**
     * Assert
     */
      expect(validator.valid(), false);
    });

    test('Ticket used in the selected data must pass validation', () {
      /**
        * Arrange
        */
      final faker = Faker();
      final selectedDate = faker.date.dateTime();
      final ticketId = faker.guid.guid();
      final holderId = faker.randomGenerator.integer(99999);
      final holderName = faker.person.name();
      final providerId = faker.randomGenerator.integer(99999);
      final providerName = faker.person.name();

      Ticket t1 = Ticket(
        id: ticketId,
        createdAt: selectedDate,
        holder: TicketHolder(id: holderId, name: holderName),
        provider: TicketProvider(id: providerId, name: providerName),
      );

      Ticket t2 = Ticket(
        id: ticketId,
        createdAt: selectedDate,
        holder: TicketHolder(id: holderId, name: holderName),
        provider: TicketProvider(id: providerId, name: providerName),
      );

      IValidatable validator = TicketMatchesWithExpectedDataValidator(
          [t1.id, t1.createdAt, t1.holder, t1.provider],
          [t2.id, t2.createdAt, t2.holder, t2.provider]);

      /**
       * Act
       */
      print('Ticket #1: $t1');
      print('Ticket #2: $t2');
      final result = validator.valid();

      /**
       * Assert
       */
      expect(result, true);
    });

    group('Ticket used in different selected data must not pass validation: ',
        () {
      test('Ticket used in a different selected date must not pass validation',
          () {
        /**
        * Arrange
        */
        /**
        * Arrange
        */
        final faker = Faker();
        final selectedDateT1 = faker.date.dateTime();
        final selectedDateT2 = faker.date.dateTime();
        final ticketId = faker.guid.guid();
        final holderId = faker.randomGenerator.integer(99999);
        final holderName = faker.person.name();
        final providerId = faker.randomGenerator.integer(99999);
        final providerName = faker.person.name();

        Ticket t1 = Ticket(
          id: ticketId,
          createdAt: selectedDateT1,
          holder: TicketHolder(id: holderId, name: holderName),
          provider: TicketProvider(id: providerId, name: providerName),
        );

        Ticket t2 = Ticket(
          id: ticketId,
          createdAt: selectedDateT2,
          holder: TicketHolder(id: holderId, name: holderName),
          provider: TicketProvider(id: providerId, name: providerName),
        );

        IValidatable validator = TicketMatchesWithExpectedDataValidator(
            [t1.id, t1.createdAt, t1.holder, t1.provider],
            [t2.id, t2.createdAt, t2.holder, t2.provider]);

        /**
       * Act
       */
        print('Ticket #1: $t1');
        print('Ticket #2: $t2');
        final result = validator.valid();

        /**
       * Assert
       */
        expect(result, false);
      });

      test(
          'Ticket used in a different programed route to the selected one must not pass validation',
          () {});
    });
  });
}
