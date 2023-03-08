import 'package:flutter/material.dart';

class button extends StatelessWidget {
  String buttonName;
  final Function()? ontap;
  Color? color;
  button({super.key, required this.buttonName, this.ontap, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 60,
          width: 300,
          child: ElevatedButton(
            onPressed: ontap,
            style: ElevatedButton.styleFrom(backgroundColor: color),
            child: Text(
              buttonName,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
