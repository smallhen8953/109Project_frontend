import 'package:the_help_list/models/Allevents_json.dart';

/*class Services {
  Future<String> _loadRecordsAsset() async {
    return await rootBundle.loadString('assets/data/Event.json');
  } //_loadRecordsAsset

  Future<Allevents> getHisevents() async {
    String jsonString = await _loadRecordsAsset();
    final jsonResponse = json.decode(jsonString);
    Allevents records = new Allevents.fromJson(jsonResponse);
    return records;
  }
}*/
class AlleventList {
  List<Allevents> allevents;
  AlleventList({this.allevents});
  factory AlleventList.fromJson(List<dynamic> parsedJson) {
    List<Allevents> allevents = new List<Allevents>();
    allevents = parsedJson.map((i) => Allevents.fromJson(i)).toList();
    return new AlleventList(
      allevents: allevents,
    );
  }
}
/*import 'package:http/http.dart' as http;
import 'package:the_help_list/models/Allevents_json.dart';

class Services {
  static Future<List<Allevents>> getHisevents() async {
    try {
      http.Response response = await http.get(
          Uri.parse("https://109project.azurewebsites.net/event/getAllevents"));
      if (200 == response.statusCode) {
        final List<Allevents> Alleve = alleventsFromJson(response.body);
        print(response.body);
        return Alleve;
      } else {
        return List<Allevents>();
      }
    } catch (e) {
      return null;
    }
  }

  static Future<List<Allevents>> getOneevents(String eveName) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://109project.azurewebsites.net/event/getOneevents/" +
              eveName));
      if (200 == response.statusCode) {
        final List<Allevents> Oneeve = alleventsFromJson(response.body);
        print(response.body);
        return Oneeve;
      } else {
        return List<Allevents>();
      }
    } catch (e) {
      return List<Allevents>();
    }
  }

  static Future<List<Allevents>> creatPost(String eveName, String eveIssuerName,
      String eveType, String eveLoc, int evePoint) async {
    try {
      print("flag5");
      // print('進');
      /*Map data = {
        "eveName": eveName,
        "eveIssuerName": eveIssuerName,
        "eveType": eveType,
        "eveLoc": eveLoc,
        "evePoint": evePoint,
      };*/
      //print(data);
      final String postApi =
          "https://109project.azurewebsites.net/event/createevent";
      var request = await http.post(Uri.parse(postApi), body: {
        "eveName": eveName,
        "eveIssuerName": eveIssuerName,
        "eveType": eveType,
        "eveLoc": eveLoc,
        "evePoint": evePoint,
      });
      //print(response);
      var data = request.body;
      print("flag4");
      print(data);
      print(request.statusCode);
      //http.Response response = await http.post(Uri.parse("https://109project.azurewebsites.net/event/createevent"));
      if (200 == request.statusCode) {
        print("requestflag");
        /*String responseString = response.body;
        alleventsFromJson(responseString);*/
        final List<Allevents> Alleve = alleventsFromJson(request.body);
        print(request.body);
        return Alleve;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<Allevents>> updateHelper(
      String eveName, String eveHelperName) async {
    try {
      final String updateApi =
          "https://109project.azurewebsites.net/event/updateevent/" + eveName;
      var response = await http.put(Uri.parse(updateApi), body: {
        "eveHelperName": eveHelperName,
      });
      var data = response.body;
      print(data);
      if (200 == response.statusCode) {
        /*String responseString = response.body;
        alleventsFromJson(responseString);*/
        final List<Allevents> Alleve = alleventsFromJson(response.body);
        print(response.body);
        return Alleve;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}*/
