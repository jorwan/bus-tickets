import 'package:bus_ticket_app/src/io_secure_message.dart';
import 'package:bus_ticket_app/src/io_ticket_message.dart';
import 'package:test/test.dart';

void main() {
  test('Updating balance of gotten ticket from outside', () {

    /**
     * Arrange
     * 
     * A service cost 25 and an user try to use a ticket without enough balance
     * The user try to use a ticket in an unknow provider system
     */
    // Message
    String msg = '{"content":{"ticket_id":"4c91ec53-c835-4e43-b410-bf3f07f25364","balance":6},"error":"","token":"980a42ed-f93c-496e-8b05-01ed1f482205"}';
    // Cost per trip
    double tripCost = 25;
    // Encrypt message
    var ioMsg = GeneralIOSecureMessage(password: 'itla');
    var ioMsg2 = GeneralIOSecureMessage(password: 'itla');
    String secureMsg = ioMsg.secureMessage(msg);

    /**
     * Act
     */
    // Decrypt message
    String readableMsg = ioMsg.getReadableMessage(secureMsg);
    
    // IO ticket message
    var ioTicketMessage = IOTicketMessage.fromJson(readableMsg);

    String msgToReturn = '';

    try{
      ioTicketMessage.reduceFromBalance(tripCost);
    }catch(e){
      print(e);
      // turn on red light 
    }finally{
      // Retornar la cadena actualizada
      msgToReturn = ioMsg.secureMessage(ioTicketMessage.toJson());
    }

    print(msgToReturn);
    print(ioMsg.getReadableMessage(msgToReturn));
    print(ioMsg2.getReadableMessage(msgToReturn));
    /**
     * Assert
     */


  });
}
