import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_help_list/models/Product.dart';


class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20),
            constraints: BoxConstraints.tightFor(width: 500,height: 280),
            decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 2.0,color: Colors.black54)
            ),

              child: Row(
                children: <Widget>[
                  Expanded(flex: 1,child: Text("${product.title}\n\n\$${product.price}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 35,color: Colors.white,),),),
                  Expanded(flex: 1,child: Hero(tag: "${product.id}", child: Image.asset(product.image,width: 100),),),
                ]
            ),

            ),
        ),

        ],
      ),
    );
  }
}
