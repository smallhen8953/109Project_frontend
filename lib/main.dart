import 'package:flutter/material.dart';
import 'package:the_help_list/pages/Hp_mytask_post.dart';
import 'package:the_help_list/pages/Hp_explore_alleve_detail.dart';
import 'package:the_help_list/pages/rating/demo_screen.dart';
import 'pages/Hp_explore.dart';
import 'pages/Hp_explore_allevent.dart';
import 'pages/Hp_mytask_post.dart';
import 'pages/Home.dart';
import 'package:the_help_list/pages/SignIn.dart';
import 'package:the_help_list/pages/register_n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_help_list/pages/cart/cart_screen.dart';
import 'package:the_help_list/pages/shop_home/home_screen.dart';
import 'package:the_help_list/pages/cart/components/history_card.dart';
import 'package:the_help_list/pages/product_details/details_screen.dart';
import 'try.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_help_list/pages/chatroom/chatHome.dart';
import 'package:the_help_list/pages/shared_preferences_util.dart';
import 'package:the_help_list/pages/emergency/emerPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: ColorScheme,
        primaryColor: Color(0xFFd5c49d),
        accentColor: Color(0xFFf1ebde),
        textTheme: GoogleFonts.ebGaramondTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: new Scaffold(
        body: Center(
          //child: new SignInSection(),
          child: new Home(),
          //child: new category_page(),
        ),
      ),
      routes: <String, WidgetBuilder>{
        'category_page': (BuildContext context) => category_page(),
        'PostYourTask': (
          BuildContext context,
        ) =>
            PostYourTask(),
        'DetailPage': (
          BuildContext context,
        ) =>
            DetailPage(),
        'exploreTask': (
          BuildContext context,
        ) =>
            exploreTask(),
        'Home': (
          BuildContext context,
        ) =>
            Home(),
        'chatHome': (
          BuildContext context,
        ) =>
            chatHome(),
        'rating': (
          BuildContext context,
        ) =>
            DemoScreen(),
        'emergency': (
          BuildContext context,
        ) =>
            Emergency(),
        //'RegisterPage': (BuildContext context, ) => RegisterPage(),
        //'CartScreen': (BuildContext context, ) => CartScreen(),
        //'HomeScreen': (BuildContext context, ) => HomeScreen(),
        //'HistoryCard': (BuildContext context, ) => HistoryCard(),
        //'DetailsScreen': (BuildContext context, ) => DetailsScreen(),
      },
      //initialRoute: 'category_page',
    );
  }
}

/*
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String key = "user";
  String userName = "guest";

  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      userName = (sp.getString(key) ?? "guest");
    });
  }

  _updateData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      sp.setString(key, "loginusername"); //get 登入者
    });
  }

  @override
  Widget build(BuildContext context) {}
}*/
