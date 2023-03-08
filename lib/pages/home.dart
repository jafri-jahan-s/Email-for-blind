import 'package:email_for_blind/components/google_auth.dart';
import 'package:email_for_blind/pages/Inbox.dart';
import 'package:email_for_blind/pages/compose.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import 'googl_login.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            button(
              buttonName: 'Compose',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => compose()),
                );
              },
            ),
            button(
              buttonName: 'Inbox',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Inbox()),
                );
              },
            ),
            button(
              buttonName: 'Trash',
              ontap: () {},
            ),
            button(
              buttonName: 'Logout',
              ontap: () {
                GoogleAuthApi.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => GoogleLoginPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
