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
  final _mybox = Hive.box('MyBox');

  MyDatabase db = MyDatabase();

  @override
  void initState() {
    //calling some default data
    if (_mybox.get("List") == null) {
      db.DefaultTasks();
    } else {
      //database already exists
      db.LoadData();
    }
    super.initState();
  }

  TextEditingController _controller = TextEditingController();

  void Onchanged(value, index) {
    setState(() {
      db.List_Tile[index][1] = !db.List_Tile[index][1];
    });
    db.UpdateDatabase();
  }

  //save new task
  SaveTask() {
    setState(() {
      db.List_Tile.add(
        [_controller.text, false],
      );
      _controller.clear();
    });
    Navigator.pop(context);
    db.UpdateDatabase();
  }

  ///delete task
  void DeleteTask(int index) {
    setState(() {
      db.List_Tile.removeAt(index);
    });
    db.UpdateDatabase();
  }

  //floating action button create new task
  CreateNew_Task() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog_Box(
              onsave: () {
                SaveTask();
              },
              oncancel: () => Navigator.pop(context),
              controller: _controller);
        });
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
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.user,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        onPressed: CreateNew_Task,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemCount: db.List_Tile.length,
        itemBuilder: (context, index) {
          return List_TileL(
            deletefunction: (context) => DeleteTask(index),
            istaskdone: db.List_Tile[index][1],
            text: db.List_Tile[index][0],
            onchanged: (value) => Onchanged(value, index),
          );
        },
      ),
    );
  }
}
