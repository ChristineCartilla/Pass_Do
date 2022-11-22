import 'package:flutter/material.dart';
import 'package:pass_do/customscroll.dart';
import 'package:pass_do/routes.dart';
import 'package:pass_do/Screens/WelcomeScreen/welcome_screen.dart';

void main() {
  runApp(MaterialApp(
    scrollBehavior: MyCustomScrollBehavior(),
    debugShowCheckedModeBanner: false,
    initialRoute: WelcomeScreen.routeName,
    routes: routes,
  ));
}
