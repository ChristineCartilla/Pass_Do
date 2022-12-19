import 'package:flutter/material.dart';
import 'package:pass_do/Screens/Home/admin/admin_home.dart';
import 'package:pass_do/Screens/Home/user/worker_home.dart';
import 'package:pass_do/Screens/Register/register.dart';
import 'package:pass_do/constant.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size bodySize = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
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
                    child: Center(
                      child: Container(
                        width: width * .9,
                        child: Form(
                          key: _key,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Email Address',
                                    hintText: 'Enter your email',
                                    border: OutlineInputBorder(),
                                    hintStyle: TextStyle(fontSize: 15),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
                                            .hasMatch(value)) {
                                      return "Invalid name";
                                    } else {
                                      return null;
                                    }
                                  }),
                              const SizedBox(height: 20.0),
                              TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                    hintText: 'Enter your password',
                                    border: OutlineInputBorder(),
                                    hintStyle: TextStyle(fontSize: 15),
                                  ),
                                  controller: _pass,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                            .hasMatch(value)) {
                                      return "Invalid password";
                                    } else {
                                      return null;
                                    }
                                  }
                                  /*r'^
                                    (?=.*[A-Z])       // should contain at least one upper case
                                    (?=.*[a-z])       // should contain at least one lower case
                                    (?=.*?[0-9])      // should contain at least one digit
                                    (?=.*?[!@#\$&*~]) // should contain at least one Special character
                                    .{8,}             // Must be at least 8 characters in length  
                                  $*/
                                  ),
                              const SizedBox(height: 30.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(150, 48),
                                  backgroundColor: kPrimaryColor,
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Colors.blueGrey),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    /*changes must be made if admin login or user login */
                                    // Navigator.pushReplacementNamed(
                                    //     context, AdminHome.routeName);
                                    Navigator.pushReplacementNamed(
                                        context, WorkerHome.routeName);
                                  }
                                },
                                child: const Text('Login'),
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
                                        Navigator.pushReplacementNamed(
                                            context, RegisterPage.routeName);
                                      },
                                      child: const Text('Register'),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF277BC0),
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
