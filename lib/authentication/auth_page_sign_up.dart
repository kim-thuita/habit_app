import 'package:flutter/material.dart';
import 'package:habit_app/start_up_screens/sign_in.dart';
import 'package:habit_app/start_up_screens/sign_up.dart';

class Auth_Page_Sign_UP extends StatefulWidget {
  @override
  State<Auth_Page_Sign_UP> createState() => _Auth_Page_Sign_UPState();
}

class _Auth_Page_Sign_UPState extends State<Auth_Page_Sign_UP> {
  bool showloginpage = true;
  void ToggleScreen() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return Login_Page(
        showregisterpage: ToggleScreen,
      );
    } else {
      return Sign_Up_Page(
        showloginpage: ToggleScreen,
      );
    }
  }
}
