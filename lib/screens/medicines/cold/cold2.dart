import 'package:flutter/material.dart';
import 'package:care_me/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';

class Cold2 extends StatefulWidget {
  const Cold2({Key? key}) : super(key: key);

  @override
  State<Cold2> createState() => _Cold2State();
}

class _Cold2State extends State<Cold2> {
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
                  "medicine_img/콜드에스.jpg",
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
                    '<콜드에스>',
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
                          "이 약은 감기의 여러 증상(콧물, 코막힘, 재채기, 인후(목구멍)통, 기침, 가래, 오한(춥고 떨리는 증상), 발열, 두통, 관절통, 근육통)의 완화에 사용합니다.",
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
                          "만 15세 이상은 1회 1포(20 mL), 만 11세 이상~만 15세 미만 1회 2/3 포, 만 7세 이상~만 11세 미만 1회 1/2포, 만 3세 이상~만 7세 미만 1회 1/3포, 만 2세 이상~만 3세 미만 1회 1/4포, 1일 3회 식후 30분에 복용합니다.\n\n"+
                          "만 2세 미만의 소아, 이 약에 과민증 환자, 이 약 및 이 약의 구성성분·다른 해열진통제·감기약 복용 시 천식을 일으킨 적이 있는 사람, 만 3개월 미만의 영아, MAO 억제제(항우울제, 항정신병제, 감정조절제, 항파킨슨제 등)를 복용하고 있거나 복용을 중단한 후 2주 이내의 사람은 이 약을 복용하지 마십시오.\n"+
                          "기침, 1주 이상 지속 또는 재발되는 기침, 만성 기침, 발열·발진이나 지속적인 두통이 동반되는 기침)은 의사 또는 약사와 상의하십시오.\n"+
                          "이 약 복용 후 졸음이 나타날 수 있으므로 운전 및 기계조작 시 주의하십시오.",
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
                        "https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=201603301",
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
