//@dart= 2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pass_do/Screens/WelcomeScreen/welcome_screen.dart';

import 'package:pass_do/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: WelcomeScreen.routeName,
    routes: routes,
  ));
}
