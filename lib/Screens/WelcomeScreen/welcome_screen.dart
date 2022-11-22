import 'package:flutter/material.dart';
import 'package:pass_do/Screens/WelcomeScreen/components/welcome_body.dart';
import 'package:pass_do/constant.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = "/welcome";
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: WelcomeBody(),
    );
  }
}
