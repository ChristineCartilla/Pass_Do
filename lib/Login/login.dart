import 'package:flutter/material.dart';
import 'package:pass_do/Login/components/login_body.dart';
import 'package:pass_do/constant.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kPrimaryColor,
        appBar: buildAppBar(context),
        body: const LoginBody());
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF277BC0),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        // ignore: prefer_const_constructors
        icon: Icon(
          Icons.arrow_back_ios,
          size: 25,
          color: Colors.white,
        ),
      ),
      title: const Text(
        "Log-in",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}
