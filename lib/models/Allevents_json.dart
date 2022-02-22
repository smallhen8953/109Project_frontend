import 'dart:convert';

List<Allevents> alleventsFromJson(String str) =>
    List<Allevents>.from(json.decode(str).map((x) => Allevents.fromJson(x)));

String alleventsToJson(List<Allevents> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Allevents {
  Allevents({
    this.id,
    this.eveName,
    this.eveIssuerName,
    this.eveHelperName,
    this.eveState,
    this.eveType,
    this.eveLoc,
    this.eveDate,
    this.evePoint,
  });

  String id;
  String eveName;
  String eveIssuerName;
  String eveHelperName;
  bool eveState;
  String eveType;
  String eveLoc;
  String eveDate;
  int evePoint;

  factory Allevents.fromJson(Map<String, dynamic> json) => Allevents(
        id: json["_id"],
        eveName: json["eveName"],
        eveIssuerName: json["eveIssuerName"],
        eveHelperName: json["eveHelperName"],
        eveState: json["eveState"],
        eveType: json["eveType"],
        eveLoc: json["eveLoc"],
        eveDate: json["eveDate"],
        evePoint: json["evePoint"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "eveName": eveName,
        "eveIssuerName": eveIssuerName,
        "eveHelperName": eveHelperName,
        "eveState": eveState,
        "eveType": eveType,
        "eveLoc": eveLoc,
        "eveDate": eveDate,
        "evePoint": evePoint,
      };
}
