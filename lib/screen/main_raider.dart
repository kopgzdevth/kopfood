import 'package:flutter/material.dart';
import 'package:kopfood/screen/singout_process.dart';
import 'package:kopfood/utility/my_style.dart';

class MainRaider extends StatefulWidget {
  MainRaider({Key key}) : super(key: key);

  @override
  _MainRaiderState createState() => _MainRaiderState();
}

Drawer showDrawer() => Drawer(
      child: ListView(
        children: <Widget>[
          showHead(),
        ],
      ),
    );

UserAccountsDrawerHeader showHead() {
  return UserAccountsDrawerHeader(
    decoration: MyStyle().myBoxDecoration('raider_bg.jpg'),
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

class _MainRaiderState extends State<MainRaider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Raider'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => signOutProcess(context)),
        ],
      ),
      drawer: showDrawer(),
    );
  }
}
