import 'package:flutter/material.dart';
import 'package:pass_do/Home/admin/admin_home.dart';
import 'package:pass_do/Login/login.dart';
import 'package:pass_do/constant.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

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
                      "assets/images/Register.png",
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
                                      Row(
                                        children: [
                                          Expanded(
                                            child:
                                                InputFile(label: "First Name"),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child:
                                                InputFile(label: "Last Name"),
                                          ),
                                        ],
                                      ),
                                      InputFile(label: "Email"),
                                      Row(
                                        children: [
                                          Expanded(
                                            child:
                                                InputFile(label: "Contact No."),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: InputFile(
                                                label: "Organization"),
                                          ),
                                        ],
                                      ),
                                      InputFile(
                                          label: "Password", obscureText: true),
                                      InputFile(
                                          label: "Confirm Password",
                                          obscureText: true),
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
                                                const AdminHome()));
                                  },
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Colors.blueGrey),
                                      borderRadius: BorderRadius.circular(20)),
                                  // ignore: prefer_const_constructors
                                  child: Text(
                                    "Register",
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 19,
                                      color: kPrimaryLightColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text("Have an account? "),
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
                                                    const LoginPage()));
                                      },
                                      child: const Text('Login'),
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
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        style: const TextStyle(fontSize: 15, height: 2.0, color: Colors.black),
        obscureText: obscureText,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(2),
            // contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
