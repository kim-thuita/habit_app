import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_app/home-screens/to_do_notetaker.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Be Better",
              style: GoogleFonts.openSans(
                color: Colors.black45,
                fontSize: 20,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.user),
            ),
          ],
        ),
      ),
    );
  }
}
