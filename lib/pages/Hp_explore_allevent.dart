import 'package:flutter/material.dart';
import 'package:the_help_list/helpers/constants.dart';
import 'package:the_help_list/models/Allevent_Service.dart';
import 'package:the_help_list/pages/Hp_explore_alleve_detail.dart';
import 'package:the_help_list/models/Allevent_List.dart';
import 'package:the_help_list/models/Allevents_json.dart';

class exploreTask extends StatefulWidget {
  @override
  _exploreTaskState createState() => _exploreTaskState();
}

class _exploreTaskState extends State<exploreTask> {
/*
  void initState() {
    super.initState();

    AlleventList.allevents = new List();
    

  }
  void _getRecords() async {
    AlleventList records = await Services().loadRecords();
    setState(() {
      for (AlleventList record in records.allevents) {
        this._records.records.add(record);
        this._filteredRecords.records.add(record);
      }
    });
  }  
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppbarBack_cl,
        title: new Text(
          '分類的名稱',
          style: TextStyle(color: AppbarTitle_cl),
        ),
        centerTitle: true,
      ),
      //body: _buildList(context),
      body: ListView(padding: const EdgeInsets.only(top: 20.0), children: [
        Card(
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              title: Text(
                "我失蹤了",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              subtitle: Row(
                children: <Widget>[
                  new Flexible(
                      child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: "協尋",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        )
                      ]))
                ],
              ),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 30.0),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new DetailPage()));
              },
            ),
          ),
        ),
      ]),
      resizeToAvoidBottomInset: false,
    );
  }

  /*Widget _buildList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children:
          this._Allevents.map((data) => _buildListItem(context, data)).toList(),
      //scrollDirection: Axis.horizontal,
    );
  }

  Widget _buildListItem(BuildContext context, Allevents Alleve) {
    return Card(
      key: ValueKey(Alleve.eveName),
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          title: Text(
            Alleve.eveName,
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          subtitle: Row(
            children: <Widget>[
              new Flexible(
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: Alleve.eveType,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      maxLines: 3,
                      softWrap: true,
                    )
                  ]))
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new DetailPage(Alleve: Alleve)));
          },
        ),
      ),
    );
  }*/
}
