import 'package:flutter/material.dart';
import 'package:the_help_list/helpers/constants.dart';
import 'package:the_help_list/pages/shop_home/components/body.dart';
import 'package:the_help_list/pages/cart/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(

      backgroundColor: AppbarBack_cl,
      title: new Text(title_product,style: TextStyle(color: AppbarTitle_cl),
      ),
      centerTitle: true,

      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {},
      ),

      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            // By default our  icon color is white
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.shopping_cart
            // By default our  icon color is white
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
          },
        ),
        SizedBox(width: 20)
      ],
    );
  }
}
