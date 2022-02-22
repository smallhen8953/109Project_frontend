import 'package:flutter/material.dart';
import 'package:the_help_list/models/Product.dart';


class Price extends StatelessWidget{
  const Price({
    Key key,
    @required this.product,
  }) : super(key: key);
  final Product product;

  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      alignment:Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Price \$${product.price}",
              style: Theme.of(context).textTheme.headline4.copyWith(
                  color: Colors.black, fontWeight: FontWeight.w300,fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}