import 'package:flutter/material.dart';
import 'package:habit_app/authentication/auth_page.dart';
import 'package:habit_app/start_up_screens/intro_screen2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'intro_screen1.dart';
import 'intro_screen3.dart';

class On_Boarding_Sreen extends StatefulWidget {
  @override
  State<On_Boarding_Sreen> createState() => _On_Boarding_SreenState();
}

class _On_Boarding_SreenState extends State<On_Boarding_Sreen> {
  //controller to kep track of which page we are in
  PageController _controller = PageController();

  //boolean to identify wheteher you are at the last screen or not
  bool onlastpage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            //setting boolean state to true if its equal to two
            onPageChanged: (index) {
              setState(() {
                onlastpage = (index == 2);
              });
            },
            children: [
              Intro_Screen1(),
              Intro_Screen2(),
              Intro_Screen3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //next and skip texts with gesture detectors
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    "Skip",
                    style:
                        GoogleFonts.openSans(fontSize: 20, color: Colors.blue),
                  ),
                ),
                //dot connector
                SmoothPageIndicator(controller: _controller, count: 3),
                onlastpage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Auth_Page(),
                            ),
                          );
                        },
                        child: Text(
                          "done",
                          style: GoogleFonts.openSans(
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () => _controller.nextPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInCirc),
                        child: Text(
                          "Next",
                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
