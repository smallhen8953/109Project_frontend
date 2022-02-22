import 'package:flutter/material.dart';
import 'package:the_help_list/models/Product.dart';
import 'package:the_help_list/pages/product_details/details_screen.dart';
import 'history_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ListView.builder(
                itemCount: cart_record.length,
                itemExtent: 100.0,
                itemBuilder: (context, index) => HistoryCard(
                      product: cart_record[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: cart_record[index],
                            ),
                          )),
                    )),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: RaisedButton(
                child: Text('結帳'),
                color: Color.fromARGB(255, 227, 204, 169),
                onPressed: () {
                  Navigator.pushNamed(context, 'Home');
                },
              ),
            ))
      ],
    );
  }
}
