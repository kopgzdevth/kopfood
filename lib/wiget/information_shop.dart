import 'package:flutter/material.dart';
import 'package:kopfood/screen/add_info_shop.dart';
import 'package:kopfood/utility/my_style.dart';

class InformationShop extends StatefulWidget {
  InformationShop({Key key}) : super(key: key);

  @override
  _InformationShopState createState() => _InformationShopState();
}

class _InformationShopState extends State<InformationShop> {
  void routeToAddInfo() {
    //print('routeToAddInfo Work');
    MaterialPageRoute materialPageRoute = MaterialPageRoute(
      builder: (context) => AddInfoShop(),
    );
    Navigator.push(context, materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MyStyle().titleCenter(context, 'ยังไม่มี ข้อมูล กรุณาเพิ่มข้อมูล'),
        addandEditButton()
      ],
    );
  }

  Row addandEditButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: FloatingActionButton(
                child: Icon(Icons.edit),
                onPressed: () => routeToAddInfo(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
