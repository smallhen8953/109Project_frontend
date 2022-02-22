import 'package:flutter/material.dart';
import 'package:the_help_list/helpers/constants.dart';
import 'package:the_help_list/models/Product.dart';
import 'package:the_help_list/pages/product_details/components/body.dart';

import 'package:the_help_list/pages/cart/cart_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child:  OutlineButton(
              borderSide:new BorderSide(color: Colors.black, width: 1.5),
              color: Colors.white,
              child: Text("\$500000",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () {
              },
            )
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>CartScreen()));
          },
        ),
        SizedBox(width: 10)
      ],
    );
  }
}
