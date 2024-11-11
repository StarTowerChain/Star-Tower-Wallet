import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
  // SystemChannels.textInput.invokeMethod('TextInput.hide');
}