import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kopfood/model/user_model.dart';
import 'package:kopfood/screen/main_raider.dart';
import 'package:kopfood/screen/main_shop.dart';
import 'package:kopfood/screen/main_user.dart';
import 'package:kopfood/utility/my_style.dart';
import 'package:kopfood/utility/normal_dialog.dart';
import 'package:kopfood/utility/publicvar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //field
  String user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: <Color>[Colors.white, MyStyle().primaryColor],
                center: Alignment(0, -0.3),
                radius: 1.0),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  MyStyle().showlogo(),
                  MyStyle().mySizebox(),
                  MyStyle().showTitle('Kop Food'),
                  MyStyle().mySizebox(),
                  userForm(),
                  MyStyle().mySizebox(),
                  passwordForm(),
                  MyStyle().mySizebox(),
                  loginButton()
                ],
              ),
            ),
          ),
        ));
  }

  Widget loginButton() {
    return Container(
      width: 250.0,
      child: RaisedButton(
        color: MyStyle().darkColor,
        onPressed: () {
          if (user == null ||
              user.isEmpty ||
              password == null ||
              password.isEmpty) {
            normalDialog(context, 'กรุณากรอกข้อมูลในการล็อคอินให้ครบ');
          } else {
            checkAuthen();
          }
        },
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<Null> checkAuthen() async {
    String url = 'http://' +
        PublicVar.StringUrl +
        '/kopfood/getUserWhereUser.php?isAdd=true&user=$user';
    try {
      Response response = await Dio().get(url);

      print('res=$response');
      var result = json.decode(response.data);

      print('result=$result');

      for (var map in result) {
        UserModel userModel = UserModel.fromJson(map);
        if (password == userModel.mypassword) {
          String chooseType = userModel.choosetype;
          if (chooseType == 'User') {
            routeToService(MainUser(), userModel);
          } else if (chooseType == 'Shop') {
            routeToService(MainShop(), userModel);
          } else if (chooseType == 'Raider') {
            routeToService(MainRaider(), userModel);
          } else {
            normalDialog(context, 'ประเภทไม่ถูกต้อง');
          }
        } else {
          normalDialog(context, 'รหัสผ่านไม่ถูกต้องครับ กรุณากรอกใหม่');
        }
      }
    } catch (e) {}
  }

  Future<Null> routeToService(Widget myWidget, UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString('id', userModel.id);
    preferences.setString('choosetype', userModel.choosetype);
    preferences.setString('myname', userModel.myname);

    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );

    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  Widget userForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().darkColor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'User :',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor),
            ),
          ),
        ),
      );

  Widget passwordForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: MyStyle().darkColor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'Password :',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor),
            ),
          ),
        ),
      );
} //end
