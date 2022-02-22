import 'package:flutter/material.dart';
import 'package:the_help_list/helpers/constants.dart';
import 'package:the_help_list/models/Allevents_json.dart';
import 'package:http/http.dart' as http;
import 'package:the_help_list/models/Allevent_List.dart';
import 'package:geolocator/geolocator.dart';
import 'package:the_help_list/pages/chatroom/chathome.dart';

class PostYourTask extends StatefulWidget {
  @override
  _PostYourTaskState createState() => _PostYourTaskState();
}

class _PostYourTaskState extends State<PostYourTask> {
  List<Allevents> _allEvents;

  final eveNameController = TextEditingController();
  final eveIssuerNameController = TextEditingController();
  final eveTypeController = TextEditingController();

  final evePointController = TextEditingController();
  Position _currentPosition;
  String userlocation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '刊登',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: AppbarBack_cl,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            //_filledBox(context, '事件名稱', '填入要幫忙的事情'),
            //_filledBox(context, '分類', '需要哪種類型的幫忙'),
            TextFormField(
              controller: eveNameController,
              keyboardType: TextInputType.name,
              maxLines: 1,
              autofocus: true,
              decoration: InputDecoration(
                  hintText: '填入要幫忙的事情',
                  labelText: '事件名稱',
                  labelStyle: TextStyle(fontSize: 25.0),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: UnderlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.black54)),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: eveIssuerNameController,
              keyboardType: TextInputType.name,
              maxLines: 1,
              autofocus: true,
              decoration: InputDecoration(
                  hintText: '你的名字',
                  labelText: 'Name',
                  labelStyle: TextStyle(fontSize: 25.0),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: UnderlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.black54)),
              style: TextStyle(color: Colors.black),
            ),
            TextFormField(
              controller: eveTypeController,
              keyboardType: TextInputType.name,
              maxLines: 1,
              autofocus: true,
              decoration: InputDecoration(
                  hintText: '哪種幫忙',
                  labelText: '分類',
                  labelStyle: TextStyle(fontSize: 25.0),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: UnderlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.black54)),
              style: TextStyle(color: Colors.black),
            ),
            //SizedBox(height: 20.0),
            /*TextFormField(
              controller: eveLocController,
              keyboardType: TextInputType.name,
              maxLines: 1,
              autofocus: true,
              decoration: InputDecoration(
                  hintText: '填入要幫忙的事情',
                  labelText: '說明',
                  labelStyle: TextStyle(fontSize: 25.0),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: UnderlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.black54)),
              style: TextStyle(color: Colors.black),
            ),*/
            SizedBox(height: 20.0),
            TextFormField(
              controller: evePointController,
              keyboardType: TextInputType.name,
              maxLines: 1,
              autofocus: true,
              decoration: InputDecoration(
                  hintText: '想給對方的點數',
                  labelText: '點數',
                  labelStyle: TextStyle(fontSize: 25.0),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: UnderlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.black54)),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20.0),

            SizedBox(
              height: 20.0,
            ),
            _enterBottom(context),
            SizedBox(
              height: 8.0,
            ),
            _allEvents == null ? Text("") : Text("The Post is successful"),
          ],
        ),
      ),
    );
  }

  Widget _enterBottom(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          print('flag');
          _getCurrentLocation();
          if (_currentPosition != null) {
            userlocation =
                "${_currentPosition.latitude}, ${_currentPosition.longitude}"; //現在位置標
          }
          print('flag2');
          final String eveName = eveNameController.text;
          final String eveIssuerName = eveIssuerNameController.text;
          final String eveType = eveTypeController.text;
          final String eveLoc = userlocation;
          final int evePoint = int.parse(evePointController.text);
          print(eveName);
          print(eveIssuerName);
          print(eveType);
          print(eveLoc);
          print("${evePoint}");

          /*List<Allevents> allEvents = await Services.creatPost(
              eveName, eveIssuerName, eveType, eveLoc, evePoint);*/

          setState(() {
            _allEvents = null; //post要記得改
            print(_allEvents);
            print('flag3');
          });
          Navigator.pushNamed(context, 'chatHome');
        },
        padding: EdgeInsets.all(12),
        color: AppbarBack_cl,
        child: Text('儲存', style: TextStyle(color: Colors.black)),
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
