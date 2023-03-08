import 'package:flutter/material.dart';
import 'package:email_for_blind/components/google_auth.dart';
import '/pages/home.dart';

class GoogleLoginPage extends StatelessWidget {
  const GoogleLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Image.asset(
              'images/logo.png',
              height: 250,
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () async {
                var user = await GoogleAuthApi.signIn();
                if (user != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => homepage()),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 3, 3, 3),
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'images/google.png',
                          height: 50,
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 75),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
