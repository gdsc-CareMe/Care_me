import 'package:flutter/material.dart';
import 'package:care_me/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';

class Oint5 extends StatefulWidget {
  const Oint5({Key? key}) : super(key: key);

  @override
  State<Oint5> createState() => _Oint5State();
}

class _Oint5State extends State<Oint5> {
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
                  "medicine_img/리도멕스.jpg",
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
                    '<리도멕스>',
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
                          "이 약은 습진, 피부염군(진행성 지장각피증, 만성단순태선 포함), 양진(가려움발진)군(구진두드러기 포함), 벌레물린데, 건선, 손바닥 및 발바닥 농포증에 사용합니다.",
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
                          "1일 수회 적당량을 환부에 바르고 증상에 따라 적절히 증감합니다.\n"+
                          "이 약에 과민증 환자, 피부감염증(결핵, 매독, 칸디다증, 백선, 대상포진, 단순포진, 수두, 종두증, 옴, 사면발이), 고막 천공이 있는 습진성 외이도염, 궤양(베체트병 제외), 제2도 심재성 이상의 화상 및 동상, 입주위피부염, 보통여드름, 주사 환자는 이 약을 사용하지 마십시오.\n"+
                          "이 약을 사용하기 전에 임부 또는 임신하고 있을 가능성이 있는 여성 및 수유부, 유ㆍ소아, 고령자는 의사 또는 약사와 상의하십시오.\n의사의 감독 없이 밀봉붕대법을 사용하지 마십시오.",
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
                        "https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=198600458",
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
