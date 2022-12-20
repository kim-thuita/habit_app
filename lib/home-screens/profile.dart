import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile_User extends StatefulWidget {
  const Profile_User({Key? key}) : super(key: key);

  @override
  State<Profile_User> createState() => _Profile_UserState();
}

class _Profile_UserState extends State<Profile_User> {
  var user = FirebaseAuth.instance.currentUser;

  SignOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Profile Screen",
          style: GoogleFonts.openSans(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: 325,
              decoration: BoxDecoration(color: Colors.grey[600]),
              child: Text(
                "Always Strive To Be Better",
                style: GoogleFonts.allerta(color: Colors.black, fontSize: 30),
              ),
            ),
          ),
          Center(
            child: Icon(
              Icons.account_circle,
              size: 220,
            ),
          ),
          Text(
            "Hello : ${user!.email}",
            style: GoogleFonts.openSans(color: Colors.black, fontSize: 15),
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: SignOut,
            child: Container(
              alignment: Alignment.center,
              width: 200,
              height: 55,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.black54,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Sign out",
                style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
