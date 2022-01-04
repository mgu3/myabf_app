import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myabf/model/user.dart';
import 'package:myabf/utils/globals.dart';
import 'package:myabf/utils/util.dart';
import 'package:myabf/view/login_page.dart';
import 'package:myabf/view/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Timer.periodic(const Duration(seconds: 2), (timer) {
        timer.cancel();
        autoLogin();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Image.asset(
            "images/logo.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void autoLogin() async {
    User? user = await Util.getLocalUser();

    if (user != null) {
      Globals.currentUser = user;
      await Util.updateDeviceToken();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainPage(key: Globals.mainStateKey),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }
}
