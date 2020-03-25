import 'package:bus_ticket_app/src/ticket.dart';
import 'package:bus_ticket_app/src/ticket_token_builder.dart';
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

  test('Create ticket generate unique id', () {
    /**
     * Arrange
     */
    // Create ticket
    Ticket t1 = Ticket();
    Ticket t2 = Ticket();

    /**
     * Act
     */
    print('t1.id: ${t1.id}');
    print('t2.id: ${t2.id}');

    /**
     * Assert
     */
    // Expect t1.id is not equal to t2.id
    expect(t1.id, isNot(equals(t2.id)));
  });

  test('Create ticket generate token using default ticket-token-builder', () {
    /**
     * Arrange
     */
    Ticket t1 = Ticket();
    /**
     * Act
     */
    print('t1.token: ${t1.token}');
    print('t1: $t1');

    /**
     * Assert
     */
    expect(t1.token, TicketTokenBuilder().build(t1));
  });
}
