import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_app/reusables/button.dart';
import 'package:habit_app/start_up_screens/sign_in.dart';
import '../home-screens/home.dart';
import '../reusables/text_fields.dart';
import '../reusables/image_containers.dart';

class Sign_Up_Page extends StatefulWidget {
  const Sign_Up_Page({Key? key}) : super(key: key);

  @override
  State<Sign_Up_Page> createState() => _Sign_Up_PageState();
}

class _Sign_Up_PageState extends State<Sign_Up_Page> {
  ///controllers to identify the user from the password
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Sign_UP SCREEN",
          style: GoogleFonts.openSans(
            color: Colors.black45,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          //icons
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Center(
              child: Icon(
                Icons.lock_open_rounded,
                size: 100,
              ),
            ),
          ),
          //tesxtfields for the username and password
          Reusable_TextField(
            controller: _username,
            prefixIcon: Icon(Icons.verified_user),
            hinttext: 'Enter Username',
            Obscuretext: false,
          ),
          Reusable_TextField(
            controller: _password,
            prefixIcon: Icon(Icons.password),
            hinttext: 'enter Password',
            Obscuretext: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                //gesture detector to prompt you to forgot password screen
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Text(
                    "Forgot Password ?",
                    style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Button_Reusables(
            ontap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home_Page(),
              ),
            ),
            text: 'Sign UP',
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 0.5,
                ),
              ),
              //implementations of other sign in options
              Text("Or Continue with"),
              Expanded(
                child: Divider(
                  thickness: 0.5,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              image_containers(
                icon: FaIcon(FontAwesomeIcons.google),
              ),
              image_containers(icon: FaIcon(FontAwesomeIcons.twitter))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Have An Account?"),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login_Page(),
                  ),
                ),
                child: Text(
                  "Sign In!",
                  style: GoogleFonts.openSans(
                      color: Colors.deepOrange,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
