import 'package:email_for_blind/pages/home.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  double hpad;
  double vpad;
  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.hpad,
    required this.vpad,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hpad,
        vertical: vpad,
      ),
      child: TextField(
        // style: TextStyle(height: height),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}

class Mymultilinetextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  double hpad;
  double vpad;
  int minline;
  int maxline;
  Mymultilinetextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.hpad,
    required this.vpad,
    required this.minline,
    required this.maxline,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hpad,
        vertical: vpad,
      ),
      child: TextField(
        minLines: minline,
        maxLines: maxline,
        // style: TextStyle(height: height),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
    ;
  }
}
