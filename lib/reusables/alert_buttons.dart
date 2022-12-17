import 'package:flutter/material.dart';

class Alert_Buttons extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const Alert_Buttons({super.key, required this.text, required this.callback});

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        height: 40,
        width: 85,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.amberAccent),
          onPressed: callback,
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
