import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String fName;
  final String lName;
  final String emailAdd;
  final String contactNum;
  final String org;
  final String pass;
  final String? userType;

  AddUser(this.fName, this.lName, this.emailAdd, this.contactNum, this.org,
      this.pass, this.userType);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'First Name': fName,
            'Last Name': lName,
            'Email Address': emailAdd,
            'Contact Number': contactNum,
            'Organization': org,
            'Password': pass,
            'User Type': userType
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}
