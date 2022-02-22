import 'package:flutter/material.dart';
import 'package:the_help_list/pages/cart/components/body.dart';
import 'package:the_help_list/helpers/constants.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    int money = 5000;
    return AppBar(
      backgroundColor: AppbarBack_cl,
      title: new Text(
        title_cart,
        style: TextStyle(color: AppbarTitle_cl),
      ),
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {},
      ),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: OutlineButton(
              borderSide: new BorderSide(color: Colors.black, width: 1.5),
              color: Colors.white,
              child: Text(
                "\$5000",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () {},
            )),
        IconButton(
          icon: Icon(Icons.shopping_cart
              // By default our  icon color is white
              ),
          onPressed: () {},
        ),
        SizedBox(width: 20)
      ],
    );
  }
}
