/**
 * Interface of In/Out Secure Message
 */
abstract class IIOSecureMessage {
  
  String getReadableMessage(String msg);

  String secureMessage(String msg); 
}