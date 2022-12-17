import 'package:flutter/material.dart';
import 'package:habit_app/reusables/alert_buttons.dart';

class Dialog_Box extends StatelessWidget {
  final controller;
  final VoidCallback onsave;
  final VoidCallback oncancel;
  final Function(BuildContext)? deleteFunction;

  Dialog_Box(
      {super.key,
      required this.controller,
      required this.onsave,
      required this.oncancel,
      this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[350],
      content: Container(
        width: 100,
        height: 150,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'What is on your mind',
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.amberAccent),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Alert_Buttons(text: 'Save', callback: onsave),
                Alert_Buttons(text: 'Cancel', callback: oncancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
