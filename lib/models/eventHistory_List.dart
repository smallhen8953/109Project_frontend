import 'package:the_help_list/models/eventHistory.dart';
class eventHis_list {
  List<eventHistory> eventHistorys = new List();
  eventHis_list({
    this.eventHistorys
  });
  factory eventHis_list.fromJson(List<dynamic> parsedJson) {
    List<eventHistory> events = new List<eventHistory>();
    events = parsedJson.map((i) => eventHistory.fromJson(i)).toList();
    return new eventHis_list(
      eventHistorys: events,
    );
  }
}