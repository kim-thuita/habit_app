import 'package:flutter/material.dart';
import 'package:habit_app/authentication/firebase_options.dart';
import 'package:habit_app/start_up_screens/on_boarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp();
  await Hive.initFlutter();
  var openbox = await Hive.openBox('MyBox');
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit App',
      home: On_Boarding_Sreen(),
    ),
  );
}
