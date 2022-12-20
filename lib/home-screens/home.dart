import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_app/data/database.dart';
import 'package:habit_app/home-screens/profile.dart';
import 'package:habit_app/home-screens/searchpage.dart';
import 'package:habit_app/home-screens/to_do_notetaker.dart';
import 'package:habit_app/reusables/alert_dialog.dart';
import 'package:hive/hive.dart';

import '../reusables/List_Tile_Reusable.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final _mybox = Hive.box('mybox');

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();

    ///if it was first time loading the app, default tasks are loaded
    if (_mybox.get('mybox') == null) {
      db.DefaultTasks();
    } else {
      ///else if data exists
      db.LoadData();
    }
  }

  MyDatabase db = MyDatabase();

  void CheckboxChanged(bool? value, int index) {
    setState(() {
      db.List_Tile[index][1] = !db.List_Tile[index][1];
    });
    db.UpdateDatabase();
  }

  TextEditingController _controller = TextEditingController();

  void SaveNewTask() {
    setState(() {
      db.List_Tile.add([_controller.text, false]);
      _controller.clear();
    });
    db.UpdateDatabase();
    Navigator.pop(context);
  }

  void CreateNewTask() {
    showDialog(
        context: context,
        builder: (
          context,
        ) {
          return Dialog_Box(
              controller: _controller,
              onsave: SaveNewTask,
              oncancel: () => Navigator.pop(context));
        });
  }

  void DeleteTask(index) {
    setState(() {
      db.List_Tile.removeAt(index);
    });
    db.UpdateDatabase();
  }

  SignOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: FaIcon(FontAwesomeIcons.searchengin))
        ],
        title: Text(
          "Be Better",
          style: GoogleFonts.openSans(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[400],
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 50),
          children: [
            Icon(
              Icons.account_circle,
              color: Colors.black,
              size: 140,
            ),
            SizedBox(height: 40),
            Text(
                style: GoogleFonts.openSans(color: Colors.black),
                textAlign: TextAlign.center,
                "Signed in as ${user!.email}"),
            SizedBox(height: 20),
            Divider(
              thickness: 5,
              color: Colors.blueGrey,
            ),
            reusable_ListTile(
              icon: Icon(Icons.account_circle),
              text: 'User Profile',
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile_User()));
              },
            ),
            reusable_ListTile(
                ontap: SignOut, icon: Icon(Icons.logout), text: 'Logout')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amberAccent,
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.red,
          ),
          onPressed: CreateNewTask),
      body: ListView.builder(
        itemCount: db.List_Tile.length,
        itemBuilder: (context, index) {
          return List_TileL(
              deletetask: (context) => DeleteTask(index),
              onchanged: (value) => CheckboxChanged(value, index),
              istaskdone: db.List_Tile[index][1],
              text: db.List_Tile[index][0]);
        },
      ),
    );
  }
}
