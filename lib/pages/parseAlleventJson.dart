import 'package:flutter/material.dart';
import 'package:the_help_list/models/Allevent_List.dart';
import 'package:the_help_list/models/Allevents_json.dart';

class parseAllevent extends StatefulWidget {
  @override
  _parseAlleventState createState() => _parseAlleventState();
}

class _parseAlleventState extends State<parseAllevent> {
  List<Allevents> _Allevents;
  bool _loading;

  /* @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getHisevents().then((allevents) {
      setState(() {
        _Allevents = allevents;
        _loading = false;
      });

    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? "Loading" : "parse demo"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _Allevents ? 0 : _Allevents.length,
          itemBuilder: (context, index) {
            Allevents Alleve = _Allevents[index];
            return ListTile(
              title: Text(Alleve.eveName),
              subtitle: Text(Alleve.eveLoc),
            );
          },
        ),
      ),
    );
  }
}
