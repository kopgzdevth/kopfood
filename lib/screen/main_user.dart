import 'package:flutter/material.dart';

import 'package:kopfood/screen/singout_process.dart';
import 'package:kopfood/utility/my_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainUser extends StatefulWidget {
  MainUser({Key key}) : super(key: key);

  @override
  _MainUserState createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  String nameUser;

  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameUser = preferences.getString('myname');
    });
  }

  Drawer showDrower() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(),
          ],
        ),
      );

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('user_bg.jpg'),
      currentAccountPicture: MyStyle().showlogo(),
      accountName: Text(
        'Name Login',
        style: TextStyle(color: MyStyle().darkColor),
      ),
      accountEmail: Text(
        'Login',
        style: TextStyle(color: MyStyle().primaryColor),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main User $nameUser'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => signOutProcess(context))
        ],
      ),
      drawer: showDrower(),
    );
  }
}
