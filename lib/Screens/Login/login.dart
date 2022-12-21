import 'package:cloud_firestore/cloud_firestore.dart';
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
  final TextEditingController _emailAdd = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final List<String> roleItems = [
    'User',
    'Admin',
  ];
  String? _selectedValue = 'User';

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
                                height: 25,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: _selectedValue,
                                  items: roleItems
                                      .map((e) => DropdownMenuItem(
                                            child: Text(e),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      this._selectedValue = val;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Email Address',
                                    hintText: 'Enter your email',
                                    border: OutlineInputBorder(),
                                    hintStyle: TextStyle(fontSize: 15),
                                  ),
                                  controller: _emailAdd,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
                                            .hasMatch(value)) {
                                      return "Invalid email address";
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
                                        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                                            .hasMatch(value)) {
                                      return "Password must contain at least 8 characters with\nat least 1 upper case, 1 lower case, and 1 digit";
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
                                    if (_selectedValue == 'User') {
                                      Navigator.pushReplacementNamed(
                                          context, WorkerHome.routeName);
                                    } else {
                                      Navigator.pushReplacementNamed(
                                          context, AdminHome.routeName);
                                    }
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
                                height: 60,
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

  Future<void> login() async {
    var collection = FirebaseFirestore.instance.collection('Users');
    var docSnapshot = await collection.doc(_emailAdd.text).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;

      // You can then retrieve the value from the Map like this:
      String name = data['User Type'];

      if (name == 'User') {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, WorkerHome.routeName);
      } else if (name == 'Admin') {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, AdminHome.routeName);
      } else {
        const AlertDialog(title: Text('User does not exist'));
      }
    }
  }
}
