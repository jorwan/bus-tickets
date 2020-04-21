import 'dart:convert';

import 'i_io_secure_message.dart';

class GeneralIOSecureMessage implements IIOSecureMessage {
  String _password = '';
  String get password => _password;
  set password(value) => _password = _encodeMessage(value).replaceAll('=', '').split("").reversed.join();

  GeneralIOSecureMessage({String password}){
    if(password != null && password.length > 0)
      this.password = password;
  }

  String getReadableMessage(String msg) => _decodeMessage(_mixMessage(_removeLock(msg)));

  String secureMessage(String msg) => _addLock(_mixMessage(_encodeMessage(msg))); 

  String _mixMessage(String msg) {
    // Message's length to split
    int msgLenSplit = msg.length~/2;
    // Message's first-cut
    String msgFirstCut = msg.substring(0, msgLenSplit);
    // Rest of message after first cut
    String restOfMessage = msg.substring(msgLenSplit, msg.length);
    // Reverse message-first-cut
    String msgFirstCutReversed = msgFirstCut.split("").reversed.join();

    String restOfMessageReversed = restOfMessage.substring(0, restOfMessage.length-2).split("").reversed.join() 
    + restOfMessage.substring(restOfMessage.length-2, restOfMessage.length);

    return msgFirstCutReversed + restOfMessageReversed;
  }

  String _encodeMessage(String msg) => base64.encode(utf8.encode(msg));

  String _decodeMessage(String msg) => utf8.decode(base64.decode(msg));

  String _addLock(String str) => password + str;

  String _removeLock(String str) => (password ?? '').length > 0 ? str.replaceFirst(password, '') : str;

}