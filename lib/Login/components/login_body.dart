import 'package:flutter/material.dart';
import 'package:pass_do/Home/user/worker_home.dart';
import 'package:pass_do/Register/register.dart';
import 'package:pass_do/constant.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size bodySize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: bodySize.height,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Positioned(
                    child: Image.asset(
                      "assets/images/Profile.png",
                      width: bodySize.width * 0.5,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: bodySize.height * 0.15),
                  height: 700,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                const SizedBox(
                                  height: 50,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Column(
                                    children: <Widget>[
                                      InputFile(label: "Email"),
                                      InputFile(
                                          label: "Password", obscureText: true),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                MaterialButton(
                                  color: kPrimarybuttonColor,
                                  minWidth: 250,
                                  height: 70,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const WorkerHome()));
                                  },
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Colors.blueGrey),
                                      borderRadius: BorderRadius.circular(20)),
                                  // ignore: prefer_const_constructors
                                  child: Text(
                                    "Login",
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 19,
                                      color: kPrimaryLightColor,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 58, 130, 189),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text('Forgot Password?'),
                                ),
                                const SizedBox(
                                  height: 70,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text("Dont have an account? "),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(255, 58, 130, 189),
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegisterPage()));
                                      },
                                      child: const Text('Register'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget InputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}
