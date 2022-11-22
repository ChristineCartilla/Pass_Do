import 'package:flutter/material.dart';
import 'package:pass_do/Screens/Home/admin/admin_home.dart';
import 'package:pass_do/Screens/Home/admin/components/a_profile.dart';
import 'package:pass_do/Screens/Home/admin/components/a_tasks.dart';
import 'package:pass_do/Screens/Home/admin/components/a_users.dart';
import 'package:pass_do/constant.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: kPrimaryColor,
        child: ListView(
          padding: padding,
          children: [
            const SizedBox(height: 72),
            Center(
              child: Image.asset(
                "assets/images/Heading.png",
                height: 100,
              ),
            ),
            const SizedBox(height: 24),
            const Divider(
              color: Colors.white70,
              thickness: 2,
            ),
            const SizedBox(height: 24),
            buildMenuItem(
              text: 'Workload',
              icon: Icons.cases_outlined,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Users',
              icon: Icons.people,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Tasks',
              icon: Icons.file_copy_rounded,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Profile',
              icon: Icons.person,
              onClicked: () => selectedItem(context, 3),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = kPrimaryLightColor;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  selectedItem(BuildContext context, int i) {
    switch (i) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AdminHome(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AdminUsersList(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AdminTask(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AdminProfile(),
        ));
        break;
    }
  }
}
