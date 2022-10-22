import 'package:flutter/material.dart';
import 'package:pass_do/Home/admin/components/a_sidebar.dart';
import 'package:pass_do/constant.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF277BC0),
      appBar: buildAppBar(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/Heading.png",
            height: 35,
          ),
          const SizedBox(
            width: 30,
          ),
          const Text("Home"),
        ],
      ),
    );
  }
}
