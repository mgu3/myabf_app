import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myabf/model/user.dart';
import 'package:myabf/utils/const.dart';
import 'package:myabf/utils/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Util {
  static Future<void> saveLocalUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String _saved = json.encode(Globals.currentUser);
    pref.setString(KEY.SAVED_USER, _saved);
  }

  static Future<void> removeLocalUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(KEY.SAVED_USER);
  }

  static Future<User?> getLocalUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      String? _saved = pref.getString(KEY.SAVED_USER);
      if (_saved == null) {
        return null;
      } else {
        dynamic result = jsonDecode(_saved);
        User user = User.fromJson(result);
        return user;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<String> login(String email, String password) async {
    try {
      final http.Response response =
          await http.post(Uri.parse(BASE_URL + API.LOGIN),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, dynamic>{
                'username': email,
                'password': password,
                'fcm_token': Globals.deviceToken,
              }));

      Map<String, dynamic> result = json.decode(response.body);

      if (result[API.STATUS] == "Success") {
        User user = User.fromJson(result["user"]);
        user.token = Globals.deviceToken;
        Globals.currentUser = user;
        await saveLocalUser();
        return "Success";
      } else {
        return result[API.MESSAGE] ?? "";
      }
    } catch (e) {
      print(e);
      return "Connection Error";
    }
  }

  static Future<String> updateDeviceToken() async {
    if (Globals.currentUser!.token == Globals.deviceToken) {
      return "Success";
    }

    try {
      final http.Response response =
          await http.post(Uri.parse(BASE_URL + API.UPDATE_TOKEN),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, dynamic>{
                "old_fcm_token": Globals.currentUser!.token,
                "new_fcm_token": Globals.deviceToken,
              }));

      Map<String, dynamic> result = json.decode(response.body);

      if (result[API.STATUS] == "Success") {
        Globals.currentUser!.token = Globals.deviceToken;
        await saveLocalUser();
        return "Success";
      } else {
        return result[API.MESSAGE] ?? "";
      }
    } catch (e) {
      return "Connection Error";
    }
  }
}
