import 'package:flutter/material.dart';

class Intro_Screen3 extends StatelessWidget {
  const Intro_Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey.shade400,
      child: Image.asset("images/two_people.png"),
    );
  }
}
