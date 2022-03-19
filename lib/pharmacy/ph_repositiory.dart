import 'dart:convert' as convert;
import 'dart:developer';
import 'package:care_me/pharmacy/ph.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ph_repositiory {
  //api key
  var apiKey = "apiKey";

  Future<List<ph>?> loadPhs(LatLng _YX //지도의 현재 좌표를 입력받아서
      ) async {
    var addr = "약국";
    String baseUrl = "http://apis.data.go.kr/B551182/pharmacyInfoService/getParmacyBasisList"+
        "?serviceKey=nDNkIW%2F3M10lllkgW%2BGrjDSWKScH3Av7F6rPKFi1vi6aKN7TK6xN88iq84mIJc3GyvukxkHWzT1kpRRDArYaEg%3D%3D" +
        "&pageNo=1&numOfRows=10" +
        "&xPos=${_YX.longitude}" +
        "&yPos=${_YX.latitude}" +
        "&radius=3000";
    // api에서 radius의 기본값이 3000이었는데 정확히 어느정도 길이인진 모르겠음
    print('전송된 url : $baseUrl');
    
    //약국데이터가 있는 서버에서 response를 받음
    final response = await http.get(Uri.parse(baseUrl));
    
    if (response.statusCode == 200) {
      final body = convert.utf8.decode(response.bodyBytes);
      final xml = Xml2Json()..parse(body);
      final json = xml.toParker();

      Map<String, dynamic> jsonResult = convert.json.decode(json);
      final jsonph = jsonResult['response']['body']['items'];
      List<dynamic> list = jsonph['item'];
      print(jsonph);

      return list.map<ph>((item) => ph.fromJson(item)).toList();
    }
  }
}
