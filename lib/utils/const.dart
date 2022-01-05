// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const String BASE_URL = "https://test.myabf.com.au";

class KEY {
  static const String SAVED_USER = "myabf_saved_user";
}

mixin COLOR {
  static const Color PRIMARY = Color(0xff9c27b0);
  static const Color INFO = Color(0xff00bcd4);
  static const Color SUCCESS = Color(0xff4caf50);
  static const Color DANGER = Color(0xfff44336);
  static const Color WARNING = Color(0xffff9800);
  static const Color DEFAULT = Color(0xff999999);

  static const Color AUTH_HINT = Color(0xff9498AE);
  static const Color AUTH_BACK = Color(0xffF3F4F8);
}

class API {
  static const String STATUS = "status";  
  static const String MESSAGE = "message";

  static const String LOGIN = "/api/cobalt/mobile-client-register/v1.0";
  static const String UPDATE_TOKEN = "/api/cobalt/mobile-client-update/v1.0";
  static const String UNREAD_MESSAGES = "/api/cobalt/mobile-client-get-unread-messages/v1.0";
  static const String LATEST_MESSAGES = "/api/cobalt/mobile-client-get-latest-messages/v1.0";
  static const String DELETE_MESSAGE = "/api/cobalt/mobile-client-delete-message/v1.0";
  static const String DELETE_ALL = "/api/cobalt/mobile-client-delete-all-messages/v1.0";
}

bool isNumeric(String s) {
  if (s.isEmpty) {
    return false;
  }
  return double.tryParse(s) != null;
}

showAlertDialog(BuildContext context, String title, String description) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(description),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: COLOR.WARNING,
  );
}
