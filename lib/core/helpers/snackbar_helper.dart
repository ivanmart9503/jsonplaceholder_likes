import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class SnackbarHelper {
  static Flushbar successSnackbar(String message) {
    return Flushbar(
      backgroundColor: Colors.grey[900],
      icon: Icon(
        Icons.check_circle,
        color: Color(0xff009788),
      ),
      message: message,
      shouldIconPulse: false,
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      borderRadius: 5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
    );
  }

  static Flushbar failureSnackbar(String message) {
    return Flushbar(
      backgroundColor: Colors.grey[900],
      icon: Icon(
        Icons.warning,
        color: Color(0xffE06053),
      ),
      message: message,
      shouldIconPulse: false,
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      borderRadius: 5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
    );
  }

  static Flushbar infoSnackbar(String message) {
    return Flushbar(
      backgroundColor: Colors.grey[900],
      icon: Icon(
        Icons.info,
        color: Color(0xff0173B2),
      ),
      message: message,
      shouldIconPulse: false,
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      borderRadius: 5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
    );
  }
}
