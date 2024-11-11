
import 'package:crypt/crypt.dart';

class CryptUtil {

  static String sha256(String content){
    Crypt crypt = Crypt.sha256(content, salt: 'DR_HD_WALLET');
    return crypt.toString();
  }

  static bool isValid(String cryptFormatHash, String enteredPassword){
    return Crypt(cryptFormatHash).match(enteredPassword);
  }
}