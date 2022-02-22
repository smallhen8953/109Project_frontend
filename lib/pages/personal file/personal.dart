import 'package:flutter/material.dart';
import 'package:the_help_list/helpers/constants.dart';
import 'package:the_help_list/pages/shop_home/home_screen.dart';
import 'package:the_help_list/pages/cart/cart_screen.dart';

class personal extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<personal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: OutlineButton(
                borderSide: new BorderSide(color: Colors.black, width: 1.5),
                color: Colors.white,
                child: Text(
                  "\$500000",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              )),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
          ),
          SizedBox(width: 10)
        ],
        backgroundColor: AppbarBack_cl,
        title: new Text(
          title,
          style: TextStyle(color: AppbarTitle_cl),
        ),
        centerTitle: true,
      ),
      body: new ListView(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
              width: 100,
              height: 300,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/male_user.png'),
                      fit: BoxFit.fitWidth))),
          new SizedBox(
            width: 450,
            height: 30,
            child: Text(
              "                                名稱",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          new Container(
            width: 200,
            height: 60,
            alignment: Alignment.center,
            child: Text(
              "Billy Lai",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            decoration: new BoxDecoration(
                color: Color.fromARGB(255, 227, 204, 169),
                border: Border.all(width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
          new SizedBox(
            height: 30,
            child: Text(
              "                                性別",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          new Container(
            width: 300,
            height: 60,
            alignment: Alignment.center,
            child: Text(
              "男",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            decoration: new BoxDecoration(
                color: Color.fromARGB(255, 227, 204, 169),
                border: Border.all(width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
          new SizedBox(
            height: 30,
            child: Text(
              "                                評價",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          new Container(
            width: 300,
            height: 60,
            alignment: Alignment.center,
            child: Text(
              "4.8 星",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            decoration: new BoxDecoration(
                color: Color.fromARGB(255, 227, 204, 169),
                border: Border.all(width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
          new SizedBox(
            height: 30,
            child: Text(
              "                               Email",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          new Container(
            width: 200,
            height: 60,
            alignment: Alignment.center,
            child: Text(
              "appleloveJenny@gmail.com",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            decoration: new BoxDecoration(
                color: Color.fromARGB(255, 227, 204, 169),
                border: Border.all(width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
          new SizedBox(
            height: 30,
            child: Text(
              "                        任務完成次數",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          new Container(
            width: 300,
            height: 60,
            alignment: Alignment.center,
            child: Text(
              "41",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            decoration: new BoxDecoration(
                color: Color.fromARGB(255, 227, 204, 169),
                border: Border.all(width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
        ],
      ),
    );
  }
}
