import 'package:email_for_blind/components/button.dart';
import 'package:flutter/material.dart';
import '../components/textfield.dart';
import '../components/sendmail.dart';

class compose extends StatelessWidget {
  compose({Key? key}) : super(key: key);
  final composecontroller = TextEditingController();
  final tocontroller = TextEditingController();
  final subjectcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Compose")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            //   child: TextFormField(
            //     decoration: const InputDecoration(
            //       border: UnderlineInputBorder(),
            //       labelText: 'From',
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: TextFormField(
                controller: tocontroller,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'To',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: TextFormField(
                controller: subjectcontroller,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Subject',
                ),
              ),
            ),
            Mymultilinetextfield(
              maxline: 100,
              minline: 15,
              hpad: 10,
              vpad: 30,
              controller: composecontroller,
              hintText: 'compose mail',
              obscureText: false,
            ),
            button(
              buttonName: 'send',
              ontap: () => sendmail(tocontroller.text, subjectcontroller.text,
                  composecontroller.text),
            )
          ],
        ),
      ),
    );
  }
}
