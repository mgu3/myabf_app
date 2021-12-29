import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myabf/utils/const.dart';
import 'package:myabf/view/main_page.dart';
import 'package:myabf/view/signup_page.dart';
import 'package:myabf/widget/entry_field.dart';
import 'package:myabf/widget/entry_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final teEmail = TextEditingController();
  final tePassword = TextEditingController();

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
                  icon: Icons.email_outlined,
                  hint: "Email Address",
                  controller: teEmail,
                ),
                const SizedBox(height: 16),
                EntryPassword(controller: tePassword, hint: "Password"),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forgot password?"),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                    );
                  },
                  child: const Text("LOG IN"),
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
                      text: "Don't have an account?   ",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.black),
                      ),
                      children: [
                        TextSpan(
                            text: "Sign up",
                            style: const TextStyle(
                              color: COLOR.PRIMARY,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const SignupPage(),
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
