import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myabf/model/notifier.dart';
import 'package:myabf/provider/home_provider.dart';
import 'package:myabf/utils/const.dart';
import 'package:myabf/utils/globals.dart';
import 'package:myabf/utils/util.dart';
import 'package:myabf/view/detail_page.dart';
import 'package:myabf/view/login_page.dart';
import 'package:myabf/widget/notification_card.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  List<Color> colors = [
    COLOR.PRIMARY,
    COLOR.INFO,
    COLOR.SUCCESS,
    COLOR.DANGER,
    COLOR.WARNING,
    COLOR.DEFAULT
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              Globals.currentUser = null;
              await Util.removeLocalUser();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
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
              FutureBuilder<List<Notifier>>(
                future: provider.getLatestNotification(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Notifier> notifications = snapshot.data!;

                    return Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("Delete All"),
                          ),
                        ),
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              return NotificationCard(
                                notification: notifications[index],
                                color: colors[index % colors.length],
                                callback: () {
                                  Navigator.of(context).push(
                                    CupertinoPageRoute(
                                      builder: (context) => const DetailPage(),
                                    ),
                                  );
                                },
                                onDelete: () {},
                              );
                            },
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 8),
                            itemCount: notifications.length),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Container();
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateState() {
    setState(() {});
  }
}
