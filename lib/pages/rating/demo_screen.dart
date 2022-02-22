import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class DemoScreen extends StatefulWidget {
  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('來評價啦'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Center(
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Text(
              '評價本次服務',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            onPressed: _showRatingAppDialog,
          ),
        ),
      ),
    );
  }

  void _showRatingAppDialog() {
    final _ratingDialog = RatingDialog(
      ratingColor: Colors.amber,
      title: '評價此次事件',
      message: '評價計價架架'
          '評價計價架架',
      image: Image.asset(
        "assets/images/devs.jpg",
        height: 100,
      ),
      submitButton: '提交',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, '
            'comment: ${response.comment}');

        if (response.rating < 3.0) {
          print('response.rating: ${response.rating}');
        } else {
          Container();
        }

        Navigator.pushNamed(context, 'Home');
      },
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => _ratingDialog,
    );
  }
}
