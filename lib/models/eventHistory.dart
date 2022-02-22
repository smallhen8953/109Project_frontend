class eventHistory {
  String id;
  int hisEveID;
  int hisMemID;

  eventHistory({
    this.id,
    this.hisEveID,
    this.hisMemID,

  });
  factory eventHistory.fromJson(Map<String, dynamic> json){
    return new eventHistory(
      id: json["id"],
      hisEveID: json["hisEveID"],
      hisMemID:json["hisMemID"],
    );
  }
}