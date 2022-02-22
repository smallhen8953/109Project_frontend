import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:the_help_list/pages/exploreTask_page.dart';
import 'package:the_help_list/helpers/constants.dart';
import 'package:the_help_list/models/Allevent_List.dart';
import 'package:the_help_list/models/Allevents_json.dart';
import 'package:the_help_list/pages/Hp_mytask.dart';
import 'package:the_help_list/pages/SignIn.dart';

class DetailPage extends StatelessWidget {
  //final Allevents Alleve;
  // 2
  //DetailPage({"this.Alleve"});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Background_cl,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            build_Map(),
            SizedBox(
              height: 85,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "我失蹤了",
                  style: TextStyle(
                      color: Color.fromARGB(255, 105, 75, 35),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            /*SizedBox(
                height: 150,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Task Description : ',
                    style: TextStyle(color: Color.fromARGB(255, 105, 75, 35), fontSize: 20, fontWeight: FontWeight.normal ),
                  ),
                ),
              ),*/
            build_contact(context),
            Center(
              child: SizedBox(
                width: 100,
                child: Center(
                  child: RaisedButton(
                    onPressed: () async {
                      final ConfirmAction action = await confirmDialog(context);
                      print("$action");
                      if ("$action" == "ConfirmAction.ACCEPT") {
                        final String eveName = "我失蹤了";
                        final String eveHelperName = "設定幫助者 "; //"${token}";
                        /*List<Allevents> updateHelper =
                            await Services.updateHelper(eveName, eveHelperName);*/
                        Navigator.pushNamed(context, 'chatHome'); //換到聊天室
                      }
                    },
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Text('我要應徵'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build_contact(BuildContext context) {
    return Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                new Icon(
                  Icons.place,
                  color: Colors.black54,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "男9B",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          new Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                new Icon(
                  Icons.phone,
                  color: Colors.black54,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '0912345666',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          new Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                new Icon(
                  Icons.calendar_today,
                  color: Colors.black54,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "8/8 - 8/9",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          new Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                new Icon(
                  Icons.access_time_rounded,
                  color: Colors.black54,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '14:00 - 17:00',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          new Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                new Icon(
                  Icons.attach_money,
                  color: Colors.black54,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '5000',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

enum ConfirmAction { ACCEPT, CANCEL }

Future<ConfirmAction> confirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: true, //控制點擊對話框以外的區域是否隱藏對話框
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('確認應徵此事件?', style: TextStyle(fontSize: 24.0)),
        content: const Text('確認後即跳轉至聊天室與被幫助者聯繫'),
        //backgroundColor: Color.fromARGB(255, 227, 204, 169),
        actions: <Widget>[
          FlatButton(
            child: const Text('確認'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
            },
          ),
          FlatButton(
            child: const Text('取消'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          )
        ],
      );
    },
  );
}

class build_Map extends StatelessWidget {
  Completer<GoogleMapController> controller = Completer();
  final LatLng _center = const LatLng(24.983234, 121.2582597);

  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        onMapCreated: (GoogleMapController mapController) {
          controller.complete(mapController);
        },
        markers: {taipeiM1},
      ),
    );
  }
}

Marker taipeiM1 = Marker(
  markerId: MarkerId('tp1'),
  position: LatLng(24.983234, 121.2582597),
  infoWindow: InfoWindow(title: 'Task Name'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);
