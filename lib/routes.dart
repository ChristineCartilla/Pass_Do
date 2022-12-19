import 'package:flutter/cupertino.dart';
import 'package:pass_do/Screens/Home/admin/admin_home.dart';
import 'package:pass_do/Screens/Home/admin/components/a_profile.dart';
import 'package:pass_do/Screens/Home/admin/components/a_tasks.dart';
import 'package:pass_do/Screens/Home/admin/components/a_users.dart';
import 'package:pass_do/Screens/Home/admin/subcomponent/a_tasksItem.dart';
import 'package:pass_do/Screens/Home/admin/subcomponent/a_userItem.dart';
import 'package:pass_do/Screens/Home/admin/subcomponent/a_workloadItem.dart';
import 'package:pass_do/Screens/Home/user/components/subcomponent/u_taskItem.dart';
import 'package:pass_do/Screens/Home/user/components/u_notes.dart';
import 'package:pass_do/Screens/Home/user/components/u_notification.dart';
import 'package:pass_do/Screens/Home/user/components/u_profile.dart';
import 'package:pass_do/Screens/Home/user/worker_home.dart';
import 'package:pass_do/Screens/Login/login.dart';
import 'package:pass_do/Screens/Register/register.dart';

import 'package:pass_do/Screens/WelcomeScreen/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (BuildContext context) => WelcomeScreen(),
  LoginPage.routeName: (BuildContext context) => LoginPage(),
  RegisterPage.routeName: (BuildContext context) => RegisterPage(),
  AdminHome.routeName: (BuildContext context) => AdminHome(),
  WorkerHome.routeName: (BuildContext context) => WorkerHome(),
  WorkloadItem.routeName: (BuildContext context) => WorkloadItem(),
  UserItem.routeName: (BuildContext context) => UserItem(),
  AdminUsersList.routeName: (BuildContext context) => AdminUsersList(),
  TasksItem.routeName: (BuildContext context) => TasksItem(),
  AdminTask.routeName: (BuildContext context) => AdminTask(),
  AdminProfile.routeName: (BuildContext context) => AdminProfile(),
  UserTaskItem.routeName: (BuildContext context) => UserTaskItem(),
  UserProfile.routeName: (BuildContext context) => UserProfile(),
  NotesPage.routeName: (BuildContext context) => NotesPage(),
  Notifications.routeName: (BuildContext context) => Notifications(),
};
