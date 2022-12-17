import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_app/reusables/button.dart';
import 'package:habit_app/start_up_screens/sign_up.dart';
import '../reusables/image_containers.dart';
import '../reusables/text_fields.dart';

class Login_Page extends StatefulWidget {
  final VoidCallback showregisterpage;

  const Login_Page({super.key, required this.showregisterpage});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  void SignInUser() async {
    //circle progress
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       );
    //     });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _username.text, password: _password.text);
      // loading the circle
      // Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //loading the circle
      // Navigator.pop(context);
      //wrong email
      if (e.code == 'User not found') {
        WrongEmail();
      } else if (e.code == 'Wrong password entered') {
        //wrong password
        WrongPassword();
      }
    }
  }

  WrongPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Email Entered Does Not Exist"),
          );
        });
  }

  WrongEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Email Entered Does Not Exist"),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "LOGIN SCREEN",
          style: GoogleFonts.openSans(
            color: Colors.black45,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Icon(
                  Icons.lock_open_rounded,
                  size: 100,
                ),
              ),
            ),
            Reusable_TextField(
              controller: _username,
              prefixIcon: Icon(Icons.verified_user),
              hinttext: 'Enter Username',
              Obscuretext: false,
            ),
            Reusable_TextField(
              controller: _password,
              prefixIcon: Icon(Icons.password),
              hinttext: 'Enter Password',
              Obscuretext: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 34, vertical: 15),
                    child: Text(
                      "Forgot Password ?",
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Button_Reusables(
              ontap: SignInUser,
              text: 'Sign In',
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                  ),
                ),
                Text("Or Continue with"),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                image_containers(
                  icon: FaIcon(FontAwesomeIcons.google),
                ),
                image_containers(icon: FaIcon(FontAwesomeIcons.twitter))
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Do not have an Account?"),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sign_Up_Page(
                        showloginpage: () {},
                      ),
                    ),
                  ),
                  child: Text(
                    "Register Now!",
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
      ),
    );
  }
}
