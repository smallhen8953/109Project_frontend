import 'package:flutter/material.dart';

class emerPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Color(0xFFd5c49d),
        accentColor: Color(0xFFf1ebde),
      ),
      home: Emergency(
        title: '快速刊登',
      ),
    );
  }
}

class Emergency extends StatefulWidget {
  Emergency({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("快速刊登"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'chatHome');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.home_work,
                    color: Color(0XFF6D4C41),
                    size: 85.0,
                  ),
                  Text(
                    '回家',
                    style: TextStyle(
                      color: Color(0XFF6D4C41),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'chatHome');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.directions_car_rounded,
                    color: Color(0XFF6D4C41),
                    size: 85.0,
                  ),
                  Text(
                    '外出',
                    style: TextStyle(
                      color: Color(0XFF6D4C41),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'chatHome');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.elderly,
                    color: Color(0XFF6D4C41),
                    size: 85.0,
                  ),
                  Text(
                    '散步',
                    style: TextStyle(
                      color: Color(0XFF6D4C41),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'chatHome');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.self_improvement,
                    color: Color(0XFF6D4C41),
                    size: 85.0,
                  ),
                  Text(
                    '打坐',
                    style: TextStyle(
                      color: Color(0XFF6D4C41),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'chatHome');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.chat,
                    color: Color(0XFF6D4C41),
                    size: 85.0,
                  ),
                  Text(
                    '聊天',
                    style: TextStyle(
                      color: Color(0XFF6D4C41),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'chatHome');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.sports_kabaddi_rounded,
                    color: Color(0XFF6D4C41),
                    size: 85.0,
                  ),
                  Text(
                    '運動',
                    style: TextStyle(
                      color: Color(0XFF6D4C41),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
