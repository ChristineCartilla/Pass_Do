import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pass_do/Screens/Login/login.dart';
import 'package:pass_do/constant.dart';
import 'package:pass_do/Services/UserAuth.dart';

class RegisterPage extends StatefulWidget {
  static String routeName = "/register";

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _fName = TextEditingController();
  final TextEditingController _lName = TextEditingController();
  final TextEditingController _emailAdd = TextEditingController();
  final TextEditingController _contactNum = TextEditingController();
  final TextEditingController _org = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  //bool _autoValidate = false;
  //final bool _autoValidate = false;

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
      backgroundColor: const Color(0xFF277BC0),
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
                    child: Center(
                      child: Container(
                        width: width * .9,
                        child: Form(
                          key: _key,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
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
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'First name',
                                        hintText: 'Enter your first name',
                                        border: OutlineInputBorder(),
                                        hintStyle: TextStyle(fontSize: 15),
                                      ),
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      controller: _fName,
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            !RegExp(r'^[a-zA-Z ]+$')
                                                .hasMatch(value)) {
                                          return "Invalid name";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Expanded(
                                    child: TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Last name',
                                          hintText: 'Enter your last name',
                                          border: OutlineInputBorder(),
                                          hintStyle: TextStyle(fontSize: 15),
                                        ),
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                        controller: _lName,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^[a-zA-Z ]+$')
                                                  .hasMatch(value)) {
                                            return "Invalid name";
                                          } else {
                                            return null;
                                          }
                                        }),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Email Address',
                                    hintText: 'Enter your email',
                                    border: OutlineInputBorder(),
                                    hintStyle: TextStyle(fontSize: 15),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16,
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
                              const SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Contact No.',
                                          hintText: 'Enter your phone number',
                                          border: OutlineInputBorder(),
                                          hintStyle: TextStyle(fontSize: 15),
                                        ),
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                        controller: _contactNum,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$')
                                                  .hasMatch(value)) {
                                            return "Invalid phone number";
                                          } else {
                                            return null;
                                          }
                                        }),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Expanded(
                                    child: TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Organization',
                                          hintText: 'Enter your organization',
                                          border: OutlineInputBorder(),
                                          hintStyle: TextStyle(fontSize: 15),
                                        ),
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                        controller: _org,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Invalid organization";
                                          } else {
                                            return null;
                                          }
                                        }),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                    hintText: 'Enter your password',
                                    border: OutlineInputBorder(),
                                    hintStyle: TextStyle(fontSize: 15),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16,
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
                              const SizedBox(height: 10.0),
                              TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Confirm Password',
                                    hintText: 'Re-enter your password',
                                    border: OutlineInputBorder(),
                                    hintStyle: TextStyle(fontSize: 15),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                  controller: _confirmPass,
                                  validator: (value) {
                                    if (value!.isEmpty || value != _pass.text) {
                                      return "Password does not match";
                                    } else {
                                      return null;
                                    }
                                  }),
                              const SizedBox(height: 20.0),
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
                                    addUser();

                                    _dialogBuilder(context);
                                  }
                                },
                                child: const Text('Register'),
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
                                      Navigator.pushReplacementNamed(
                                          context, LoginPage.routeName);
                                    },
                                    child: const Text('Login'),
                                  ),
                                ],
                              ),
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
      backgroundColor: Colors.transparent,
      //backgroundColor: const Color(0xFF277BC0),

      // ignore: prefer_const_constructors

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

  Future<void> addUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    // Call the user's CollectionReference to add a new user
    return await users
        .add({
          'First Name': _fName.text,
          'Last Name': _lName.text,
          'Email Address': _emailAdd.text,
          'Contact Number': _contactNum.text,
          'Organization': _org.text,
          'Password': _confirmPass.text,
          'User Type': _selectedValue.toString()
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<bool> checkIfDocExists() async {
    try {
      // Get reference to Firestore collection
      var collectionRef = FirebaseFirestore.instance.collection('Users');

      var doc = await collectionRef.doc(_emailAdd.text).get();

      return doc.exists;
    } catch (e) {
      rethrow;
    }
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('User Registered Successfully'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Continue to Login'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
          ),
        ],
      );
    },
  );
}
