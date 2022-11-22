import 'package:flutter/material.dart';
import 'package:pass_do/Screens/Login/login.dart';
import 'package:pass_do/Screens/Register/register.dart';
import 'package:pass_do/Screens/WelcomeScreen/components/welcome_background.dart';
import 'package:pass_do/constant.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return WelBackground(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: Image.asset(
              "assets/images/Banner.png",
            ),
          ),
          Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                color: kPrimarybuttonColor,
                minWidth: 250,
                height: 70,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                },
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "Login",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      color: kPrimaryLightColor),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                color: kPrimaryLightColor,
                minWidth: 250,
                height: 70,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RegisterPage.routeName);
                },
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: kPrimarybuttonColor),
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "Register",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      color: kPrimarybuttonColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
