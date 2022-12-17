import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_app/data/database.dart';
import 'package:habit_app/home-screens/to_do_notetaker.dart';
import 'package:habit_app/reusables/alert_dialog.dart';
import 'package:hive/hive.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final _mybox = Hive.box('mybox');

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
      db.List_Tile[index] = !db.List_Tile[index];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      floatingActionButton: FloatingActionButton(onPressed: CreateNewTask),
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
