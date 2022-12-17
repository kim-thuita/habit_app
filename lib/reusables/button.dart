import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Reusable buttons
class Button_Reusables extends StatelessWidget {
  final String text;
  final Function() ontap;

  const Button_Reusables({super.key, required this.text, required this.ontap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: 325,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.amberAccent),
          gradient: LinearGradient(
            colors: [Colors.black, Colors.grey],
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.openSans(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
