class ph {
  String? addr; //상세주소
  String? yadmNm; //약국이름
  String? telno; //약국 전화번호
  double? XPos; //longitude
  double? YPos; //latitude

  ph({this.addr, this.yadmNm, this.telno, this.XPos, this.YPos});

  factory ph.fromJson(Map<String, dynamic> json) {
    return ph(
      addr: json["addr"] as String,
      yadmNm: json["yadmNm"] as String,
      telno: json["telno"] as String,
      XPos: json["XPos"] as double,
      YPos: json["YPos"] as double,
    );
  }
}
