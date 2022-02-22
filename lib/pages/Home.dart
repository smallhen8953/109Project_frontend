import 'package:flutter/material.dart';
import 'package:the_help_list/helpers/constants.dart';
import 'package:the_help_list/pages/Hp_explore.dart';
import 'package:the_help_list/pages/Hp_mytask.dart';
import 'package:the_help_list/pages/chatroom/chatHome.dart';
import 'package:the_help_list/pages/personal file/personal.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedItemIndex = 1;
  TabController _tabController;
  int _currentIndex = 0;
  final tabs = [
    Center(
      child: Homepage(), //My Task 轉換 我發的、我接的 tag
    ),
    Center(
      child: category_page(), //explore
    ),
    Center(
      child: chatHome(),
    ),
    Center(
      child: personal(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.new_releases,
          color: Colors.red,
          size: 30,
        ),
        onPressed: () {
          print("emergency buttom");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      */
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.brown,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            title: Text('My Task'),
            backgroundColor: AppbarBack_cl,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Explore'),
            backgroundColor: AppbarBack_cl,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            title: Text('Chat'),
            backgroundColor: AppbarBack_cl,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            backgroundColor: AppbarBack_cl,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
