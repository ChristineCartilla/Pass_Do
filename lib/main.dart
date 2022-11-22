import 'package:flutter/material.dart';
import 'package:pass_do/Screens/WelcomeScreen/welcome_screen.dart';
import 'package:pass_do/constant.dart';
import 'package:pass_do/routes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: WelcomeScreen.routeName,
    routes: routes,
  ));
}
