import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myabf/view/detail_page.dart';
import 'package:myabf/widget/notification_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 3.6,
                child: Image.asset(
                  "images/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    return NotificationCard(callback: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const DetailPage(),
                        ),
                      );
                    });
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemCount: 20)
            ],
          ),
        ),
      ),
    );
  }
}
