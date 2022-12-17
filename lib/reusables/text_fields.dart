import 'package:flutter/material.dart';

//
//Reusable Buttons
class Reusable_TextField extends StatelessWidget {
  final String hinttext;
  final Icon prefixIcon;
  final TextEditingController controller;
  final bool Obscuretext;

  const Reusable_TextField(
      {super.key,
      required this.hinttext,
      required this.prefixIcon,
      required this.controller,
      required this.Obscuretext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextField(
          textAlign: TextAlign.center,
          controller: controller,
          obscureText: Obscuretext,
          decoration: InputDecoration(
            hintText: hinttext,
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
