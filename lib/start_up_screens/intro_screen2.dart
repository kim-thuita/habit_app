import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro_Screen2 extends StatelessWidget {
  const Intro_Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey.shade400,
      child: Text(
        "One Step At A Time",
        style: GoogleFonts.openSans(color: Colors.black, fontSize: 20),
      ),
    );
  }
}
