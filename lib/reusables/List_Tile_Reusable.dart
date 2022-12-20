import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class reusable_ListTile extends StatelessWidget {
  final Icon icon;
  final String text;
  final Function()? ontap;

  reusable_ListTile(
      {super.key, required this.icon, required this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      color: Colors.grey[500],
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 30),
        title: Text(
          text,
          style: GoogleFonts.openSans(color: Colors.black),
        ),
        onTap: ontap,
        leading: icon,
      ),
    );
  }
}
