import 'package:flutter/material.dart';
import 'package:pass_do/Screens/Home/user/components/subcomponent/u_taskItem.dart';

import 'package:pass_do/Screens/Home/user/dynamic_event.dart';
import 'package:pass_do/Screens/Home/user/components/u_sidebar.dart';
import 'package:pass_do/constant.dart';

class WorkerHome extends StatefulWidget {
  static String routeName = "/userdashboard";
  const WorkerHome({super.key});

  @override
  State<WorkerHome> createState() => _WorkerHomeState();
}

class _WorkerHomeState extends State<WorkerHome> {
  @override
  Widget build(BuildContext context) {
    Size bodySize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF277BC0),
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                "TASKS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            DynamicEvent(),
            Container(
              margin: EdgeInsets.only(top: bodySize.height * 0.01),
              height: 555,
              decoration: const BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  SizedBox(
                    height: 25,
                  ),
                  Card(
                      color: Colors.grey,
                      child: ListTile(
                        title: Text(
                          "Task1",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            UserTaskItem.routeName,
                          );
                        },
                      )),
                  Card(
                      color: Colors.grey,
                      child: ListTile(
                        title: Text(
                          "Task2",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            UserTaskItem.routeName,
                          );
                        },
                      )),
                  Card(
                      color: Colors.grey,
                      child: ListTile(
                        title: Text(
                          "Task3",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            UserTaskItem.routeName,
                          );
                        },
                      )),
                  Card(
                      color: Colors.grey,
                      child: ListTile(
                        title: Text(
                          "Task4",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            UserTaskItem.routeName,
                          );
                        },
                      )),
                  Card(
                      color: Colors.grey,
                      child: ListTile(
                        title: Text(
                          "Task5",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            UserTaskItem.routeName,
                          );
                        },
                      )),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: kPrimaryColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          width: 30,
        ),
        Image.asset(
          "assets/images/Heading.png",
          height: 35,
        ),
      ],
    ),
  );
}
