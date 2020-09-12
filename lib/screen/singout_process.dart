import 'package:flutter/material.dart';
import 'package:kopfood/screen/home.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<Null> signOutProcess(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  MaterialPageRoute route = MaterialPageRoute(builder: (context) => Home());
  Navigator.pushAndRemoveUntil(context, route, (route) => false);
}
