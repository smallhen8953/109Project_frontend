import 'package:flutter/material.dart';
import 'package:the_help_list/models/Product.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5, fontWeight: FontWeight.w300, fontSize: 18),
      ),
    );
  }
}
