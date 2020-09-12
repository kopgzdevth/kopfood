import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kopfood/utility/my_style.dart';
import 'package:kopfood/utility/normal_dialog.dart';
import 'package:kopfood/utility/publicvar.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String chooseType, name, user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          myLogo(),
          MyStyle().mySizebox(),
          showAppName(),
          MyStyle().mySizebox(),
          myNameform(),
          MyStyle().mySizebox(),
          userForm(),
          MyStyle().mySizebox(),
          passwordForm(),
          MyStyle().mySizebox(),
          MyStyle().showTitleH2('ชนิดของสมาชิก :'),
          userRadio(),
          shopRadio(),
          raiderRadio(),
          MyStyle().mySizebox(),
          registerButton(),
          MyStyle().mySizebox(),
        ],
      ),
    );
  }

  Widget userRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                    value: 'User',
                    groupValue: chooseType,
                    onChanged: (value) {
                      setState(() {
                        chooseType = value;
                      });
                    }),
                Text(
                  'ผู้สั่งอาหาร',
                  style: TextStyle(color: MyStyle().darkColor),
                ),
              ],
            ),
          ),
        ],
      );

  Widget shopRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                    value: 'Shop',
                    groupValue: chooseType,
                    onChanged: (value) {
                      setState(() {
                        chooseType = value;
                      });
                    }),
                Text(
                  'เจ้าของร้านอาหาร',
                  style: TextStyle(color: MyStyle().darkColor),
                ),
              ],
            ),
          ),
        ],
      );

  Widget raiderRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                    value: 'Raider',
                    groupValue: chooseType,
                    onChanged: (value) {
                      setState(() {
                        chooseType = value;
                      });
                    }),
                Text(
                  'ผู้ส่งอาหาร',
                  style: TextStyle(color: MyStyle().darkColor),
                ),
              ],
            ),
          ),
        ],
      );

  Row showAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyStyle().showTitle(('Kop Food')),
      ],
    );
  }

  Widget myLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyStyle().showlogo(),
        ],
      );

  Widget myNameform() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => name = value.trim(),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: MyStyle().darkColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().darkColor),
                  labelText: 'Name :',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().primaryColor))),
            ),
          ),
        ],
      );

  Widget userForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
          ),
        ],
      );

  Widget passwordForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
          ),
        ],
      );

  Widget registerButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250.0,
          child: RaisedButton(
            color: MyStyle().darkColor,
            onPressed: () {
              if (name == null ||
                  name.isEmpty ||
                  user == null ||
                  user.isEmpty ||
                  password == null ||
                  password.isEmpty) {
                print('กรุณากรอกชื่อ');
              } else if (chooseType == null) {
                normalDialog(context, 'โปรดเลือก ชนิดของผู้สมัคร');
              } else {
                //print('name=$name,user=$user,password=$password');
                checkUser();
              }
            },
            child: Text(
              'Register',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> checkUser() async {
    String url =
        'http://192.168.1.33/kopfood/getUserWhereUser.php?isAdd=true&user=$user';

    try {
      Response response = await Dio().get(url);
      if (response.toString() == 'null') {
        registerThread();
      } else {
        normalDialog(
            context, 'มีข้อมูลผู้ใช้ $user นี้อยู่แล้วไม่สามารถสมัครได้');
      }
    } catch (e) {}
  }

  Future<Null> registerThread() async {
    String url = 'http://' +
        PublicVar.StringUrl +
        '/kopfood/addUser.php?isAdd=true&myname=$name&myuser=$user&mypassword=$password&choosetype=$chooseType';
    try {
      Response response = await Dio().get(url);
      print('res=$response');
      if (response.toString() == 'true') {
        Navigator.pop(context);
        normalDialog(context, 'บันทึกข้อมูลเรียบร้อยแล้ว');
      } else {
        normalDialog(context, 'มีข้อมูลผู้่ใช้นี้อยู่แล้วไม่สามารถสมัครได้');
      }
    } catch (e) {}
  }
} //end
