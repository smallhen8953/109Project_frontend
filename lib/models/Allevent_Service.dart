import 'package:the_help_list/models/Allevents_json.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Services {
  Future<String> _loadRecordsAsset() async {
    return await rootBundle.loadString('assets/data/Event.json');
  } //_loadRecordsAsset

  Future<Allevents> getHisevents() async {
    String jsonString = await _loadRecordsAsset();
    final jsonResponse = json.decode(jsonString);
    Allevents records = new Allevents.fromJson(jsonResponse);
    return records;
  }
}
