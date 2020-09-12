import 'package:flutter/material.dart';
import 'package:kopfood/screen/main_raider.dart';
import 'package:kopfood/screen/main_shop.dart';
import 'package:kopfood/screen/main_user.dart';
import 'package:kopfood/screen/signIn.dart';
import 'package:kopfood/screen/signup.dart';
import 'package:kopfood/utility/my_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    checkPreference();
  }

  Future<Null> checkPreference() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String choosetype = preferences.getString('choosetype');
      if (choosetype != null && choosetype.isNotEmpty) {
        if (choosetype == 'User') {
          routeToService(MainUser());
        } else if (choosetype == 'Shop') {
          routeToService(MainShop());
        } else if (choosetype == 'Raider') {
          routeToService(MainRaider());
        }
      }
    } catch (e) {}
  }

  void routeToService(Widget myWidget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHeadDrawer(),
            signInMenu(),
            signInUp(),
          ],
        ),
      );

  ListTile signInMenu() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign In'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignIn());
        Navigator.push(context, route);
      },
    );
  }

  ListTile signInUp() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign Up'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignUp());
        Navigator.push(context, route);
      },
    );
  }

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('guest.jpg'),
      currentAccountPicture: MyStyle().showlogo(),
      accountName: Text('Guest'),
      accountEmail: Text('Please Login'),
    );
  }
}
