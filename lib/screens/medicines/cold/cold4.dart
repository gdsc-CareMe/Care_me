import 'package:flutter/material.dart';
import 'package:care_me/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';

class Cold4 extends StatefulWidget {
  const Cold4({Key? key}) : super(key: key);

  @override
  State<Cold4> createState() => _Cold4State();
}

class _Cold4State extends State<Cold4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Image.asset(
            'image/logo.png',
            width: 53,
          ),
          centerTitle: true,
          //돌아가기 버튼
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              color: Colors.black,
              icon: Icon(Icons.arrow_back)),
        ),
        body: Container(
            child: ListView(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "medicine_img/코푸시럽.jpg",
                  width: 300.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    '<코푸시럽>',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "약의 효능",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Flexible(
                      child: Card(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "이 약은 기침, 가래에 사용합니다.",
                          style: const TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "복용 시 주의점",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Flexible(
                      child: Card(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "성인은 1회 20 mL씩, 11세 이상~15세 미만은 1회 13 mL씩, 8세 이상~11세 미만은 1회 10 mL씩, 5세 이상~8세 미만은 1회 7 mL씩, 3세 이상~5세 미만은 1회 5 mL씩, 2세 이상~3세 미만은 1회 4 mL씩, 1일 3~4회 식후 및 취침 시에 복용합니다.\n\n"+
                          "이 약에 과민증 환자, 3개월 미만의 영아, MAO 억제제(항우울제, 항정신병제, 감정조절제, 항파킨슨제 등)를 복용하고 있거나 복용을 중단한 후 2주 이내의 사람은 이 약을 복용하지 마십시오.\n"+
                          "이 약을 복용하기 전에 알레르기를 일으키기 쉬운 체질인 사람, 간장질환, 신장질환, 갑상샘질환, 당뇨병, 고열, 허약자, 심장질환 및 고혈압, 고령자, 임부 또는 임신하고 있을 가능성이 있는 여성 및 수유부, 녹내장, 배뇨장애, 흡연, 천식, 만성 기관지염, 폐기종, 과도한 가래가 동반되는 기침, 1주 이상 지속 또는 재발되는 기침, 만성 기침, 발열·발진이나 지속적인 두통이 동반되는 기침 환자, 만 2세 미만 소아는 의사 또는 약사와 상의하십시오.\n"+
                          "복용 후 졸음이 나타날 수 있으므로 운전 및 기계조작 시 주의하십시오.\n어린이에게 투여할 경우 보호자의 지도 감독하에 투여하십시오.",
                          style: const TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Container(
                    child: ElevatedButton.icon(
                  onPressed: () {
                    launch(
                        "https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=196900058",
                        forceWebView: true, //인앱 브라우저로 열기
                        forceSafariVC: true);
                  },
                  icon: Icon(Icons.add, size: 18),
                  label: Text("더 알아보기"),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xffff8787), onPrimary: Colors.white),
                )),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          )
        ])));
  }
}
