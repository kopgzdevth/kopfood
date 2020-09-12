import 'package:flutter/material.dart';
import 'package:kopfood/screen/singout_process.dart';
import 'package:kopfood/utility/my_style.dart';
import 'package:kopfood/wiget/information_shop.dart';
import 'package:kopfood/wiget/list_food_menu_shop.dart';
import 'package:kopfood/wiget/order_list_shop.dart';

class MainShop extends StatefulWidget {
  MainShop({Key key}) : super(key: key);

  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
//field
  Widget currentWidget = OrderListShop();

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(),
            homeMenu(),
            foodMenu(),
            informationMenu(),
            signOutMenu(),
          ],
        ),
      );

  ListTile homeMenu() => ListTile(
        leading: Icon(Icons.home),
        title: Text('รายการที่ลูกค้าสั่งอาหาร'),
        subtitle: Text('รายการอาหารที่ไม่ได้นำส่งลูกค้า'),
        onTap: () {
          setState(() {
            currentWidget = OrderListShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile foodMenu() => ListTile(
        leading: Icon(Icons.fastfood),
        title: Text('รายการอาหาร'),
        subtitle: Text('รายการอาหาร ของร้าน'),
        onTap: () {
          setState(() {
            currentWidget = ListFoodMenuShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile informationMenu() => ListTile(
        leading: Icon(Icons.description),
        title: Text('รายละเอียดร้าน'),
        subtitle: Text('รายละเอียด ของร้าน พร้อม Edit'),
        onTap: () {
          setState(() {
            currentWidget = InformationShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile signOutMenu() => ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text('ออกระบบ'),
        subtitle: Text('ออกจากระบบ'),
        onTap: () => signOutProcess(context),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Shop'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => signOutProcess(context),
          )
        ],
      ),
      drawer: showDrawer(),
      body: currentWidget,
    );
  }

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('shop_bg.jpg'),
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
}
