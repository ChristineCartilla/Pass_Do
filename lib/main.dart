import 'package:flutter/material.dart';
import 'package:pass_do/constant.dart';
import 'WelcomeScreen/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pass&Do',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}
