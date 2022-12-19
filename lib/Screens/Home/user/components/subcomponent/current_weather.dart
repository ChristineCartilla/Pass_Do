import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:pass_do/constant.dart';

Widget currentWeather(IconData icon, String temp, String location) {
  return Center(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: Colors.orange, size: 64.0),
      SizedBox(
        height: 10,
      ),
      Text(
        "$temp",
        style: TextStyle(fontSize: 46, color: kPrimaryLightColor),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "$location",
        style: TextStyle(fontSize: 18, color: Colors.white),
      )
    ],
  ));
}
