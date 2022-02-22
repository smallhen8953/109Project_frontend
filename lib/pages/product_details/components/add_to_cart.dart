import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:the_help_list/models/Product.dart';
import 'package:the_help_list/pages/cart/cart_screen.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
    @required this.product,
  }) : super(key: key);
  final Product product;

  void add(product){
    cart_record.add(product);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: product.color,
              ),
            ),

            child: IconButton(
              icon: Icon(
                Icons.add_circle,
                color: product.color,
              ),
              onPressed: () {
                add(this.product);

              },
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: product.color,
                onPressed: () {
                  add(this.product);
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>CartScreen()));
                },
                child: Text(
                  "直接購買".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
