import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_help_list/helpers/constants.dart';
import 'package:the_help_list/helpers/color_filters.dart';

import 'dart:convert';


class category_page extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppbarBack_cl,
        title: new Text(
          '探索任務',
          style: TextStyle(color: AppbarTitle_cl),
        ),
        centerTitle: true,

      ),
      body: Container(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              color: CategoryBack_cl,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16.0),
                  border: InputBorder.none,
                  hintText: "Search for your task",
                  prefixIcon: Icon(Icons.search_rounded),
                ),
              ),
            ),
            sortedName(context, "地區",),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
                childAspectRatio: 2 / 0.8,
                children: <Widget>[
                  _categorycard(
                    context,
                    "台北",
                  ),
                  _categorycard(
                    context,
                    "桃園",
                  ),
                  _categorycard(
                    context,
                    "新竹",
                  ),
                  _categorycard(
                    context,
                    "苗栗",
                  ),
                  _categorycard(
                    context,
                    "台中",
                  ),
                  _categorycard(
                    context,
                    "彰化",
                  ),
                  _categorycard(
                    context,
                    "雲林",
                  ),
                  _categorycard(
                    context,
                    "嘉義",
                  ),
                  _categorycard(
                    context,
                    "台南",
                  ),
                ],
              ),
            ),
            sortedName(context, "任務類型",),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
                childAspectRatio: 2 / 0.8,
                children: <Widget>[
                  _categorycard(
                    context,
                    "短期",
                  ),
                  _categorycard(
                    context,
                    "長期",
                  ),
                  _categorycard(
                    context,
                    "專業知識型",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }

  Widget _categorycard(BuildContext context, String name){
    return Container(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          clipBehavior: Clip.antiAlias,
          //elevation: 5,
          color: CategoryBack_cl,
          child: new Stack(
            alignment: Alignment.centerLeft,
            children: [
              InkWell(
                //colorFilter: ColorFilters.greyscale,
                  onTap: () {
                    Navigator.pushNamed(context, 'exploreTask'); // 顯示allevent(state應該要是true的)
                  },
                child: ListTile(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                  title: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: CategoryTitle_cl,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
                ),
                ),
                //height: 240,
                //fit: BoxFit.cover,
            ],
          ),
        ),
      ),
    );
  }
  Widget sortedName (BuildContext context, String name){
    return SizedBox(
      child: Container(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CategoryTitle_cl,
              fontSize: 25,
            ),
          ),
        ),
      ),

    );
  }
}