import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_help_list/models/Product.dart';
import 'package:the_help_list/pages/cart/cart_screen.dart';

class HistoryCard extends StatelessWidget {
  final Product product;
  final Function press;
  const HistoryCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);
  void del(product){
    cart_record.remove(product);
  }

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
                    Expanded(flex: 1,child: Hero(tag: "${product.id}", child: Image.asset(product.image,width: 100),),),
                    SizedBox(width: 10,),
                    Expanded(flex: 2,child: Text("${product.title}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 30,color: Colors.white,),),),
                    Expanded(flex: 1,child: Text("\$${product.price}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color: Colors.white,),),),
                    Expanded(flex: 1,child: IconButton(icon: Icon(Icons.delete_outline),
                      onPressed: (){del(this.product);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => CartScreen()));},)),
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}