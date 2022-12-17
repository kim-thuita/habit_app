// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:habit_app/start_up_screens/sign_in.dart';
//
// import '../home-screens/home.dart';
//
// class Auth_Page extends StatelessWidget {
//   const Auth_Page({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           ////user is logged in
//           if (snapshot.hasData) {
//             return Home_Page();
//           } else {
//             return Login_Page();
//           }
//         },
//       ),
//     );
//   }
// }
