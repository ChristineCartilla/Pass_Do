import 'package:flutter/material.dart';
import 'package:pass_do/Register/components/register_body.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF277BC0),
        appBar: buildAppBar(context),
        body: const RegisterBody());
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      //backgroundColor: const Color(0xFF277BC0),
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
        "Register",
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
