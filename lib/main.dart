import 'package:flutter/material.dart';
import 'package:habit_app/start_up_screens/on_boarding.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit App',
      home: On_Boarding_Sreen(),
    ),
  );
}
