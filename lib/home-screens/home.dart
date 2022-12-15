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
  List List_Tile = [
    ['Daily Exercise', false],
    ['Daily Walk', false]
  ];

  void Onchanged(value, index) {
    setState(() {
      List_Tile[index][1] = !List_Tile[index][1];
    });
  }

  //floating action button create new task
  void Newtask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: ListView.builder(
        itemCount: List_Tile.length,
        itemBuilder: (context, index) {
          return List_TileL(
            istaskdone: List_Tile[index][1],
            text: List_Tile[index][0],
            onchanged: (value) => Onchanged(value, index),
          );
        },
      ),
    );
  }
}
