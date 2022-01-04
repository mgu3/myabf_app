import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myabf/utils/const.dart';
import 'package:myabf/utils/globals.dart';
import 'package:myabf/view/login_page.dart';
import 'package:myabf/view/main_page.dart';
import 'package:myabf/widget/entry_field.dart';
import 'package:myabf/widget/entry_password.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final teNumber = TextEditingController();
  final teEmail = TextEditingController();
  final tePassword = TextEditingController();
  final teCPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 3.6,
                  child: Image.asset(
                    "images/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16),
                EntryField(
                  icon: Icons.person_outline,
                  hint: "ABF Number",
                  controller: teNumber,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 16),
                EntryField(
                  icon: Icons.email_outlined,
                  hint: "Email Address",
                  controller: teEmail,
                ),
                const SizedBox(height: 16),
                EntryPassword(controller: tePassword, hint: "Password"),
                const SizedBox(height: 16),
                EntryPassword(
                    controller: teCPassword, hint: "Confirm Password"),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                            MainPage(key: Globals.mainStateKey),
                      ),
                    );
                  },
                  child: const Text("SIGN UP"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(MediaQuery.of(context).size.width, 48),
                    primary: COLOR.PRIMARY,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                RichText(
                  text: TextSpan(
                      text: "Already signed up?   ",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.black),
                      ),
                      children: [
                        TextSpan(
                            text: "Log in",
                            style: const TextStyle(
                              color: COLOR.PRIMARY,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              }),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
