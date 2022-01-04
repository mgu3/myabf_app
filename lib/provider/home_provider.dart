import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myabf/model/notifier.dart';
import 'package:myabf/utils/const.dart';
import 'package:myabf/utils/globals.dart';

class HomeProvider with ChangeNotifier {
  Future<List<Notifier>> getLatestNotification() async {
    try {
      final http.Response response = await http.post(
        Uri.parse(BASE_URL + API.LATEST_MESSAGES),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Connection": "keep-alive",
        },
        body: jsonEncode(
          <String, dynamic>{
            "fcm_token": Globals.deviceToken,
          },
        ),
      );
      print(response.body);
      Map<String, dynamic> result = json.decode(response.body);

      if (result[API.STATUS] == "Success") {
        return Notifier.fromJsonList(result["un_read_messages"] as List);
      } else {
        return Future.error(Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Center(child: Text(result[API.MESSAGE])),
        ));
      }
    } catch (e) {
      throw const Padding(
        padding: EdgeInsets.only(top: 50),
        child: Center(
          child: Text('Connection Error'),
        ),
      );
    }
  }
}
