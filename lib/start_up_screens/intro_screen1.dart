import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro_Screen1 extends StatelessWidget {
  const Intro_Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey.shade400,
      child: Text(
        "Be A Better Version Of Yourself",
        style: GoogleFonts.openSans(color: Colors.black, fontSize: 20),
      ),
    );
  }
}
