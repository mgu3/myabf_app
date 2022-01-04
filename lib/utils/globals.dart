import 'package:flutter/cupertino.dart';
import 'package:myabf/model/user.dart';
import 'package:myabf/view/main_page.dart';

class Globals {
  static String deviceToken = "";
  static User? currentUser;
  static final GlobalKey<MainPageState> mainStateKey =
      GlobalKey<MainPageState>();
}
