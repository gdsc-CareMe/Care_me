import 'package:flutter/material.dart';
import 'package:care_me/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';

class Med4 extends StatefulWidget {
  const Med4({Key? key}) : super(key: key);

  @override
  State<Med4> createState() => _Med4State();
}

class _Med4State extends State<Med4> {
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
                  "medicine_img/부루펜.jpg",
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
                    '<부루펜>',
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
                          "이 약은 류마티양 관절염, 연소성 류마티양 관절염, 골관절염(퇴행성 관절질환), 감기로 인한 발열 및 동통, 요통, 월경곤란증, 수술후 동통과 강직성 척추염, 두통, 치통, 근육통, 신경통, 급성통풍, 건선성 관절염, 연조직손상(염좌, 좌상), 비관절 류마티스질환(건염, 건초염, 활액낭염)에 사용합니다.",
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
                          "만 12세 이상 소아 및 성인:\n1회 1~2정씩 1일 3-4회 (4-6시간 마다) 필요시 복용한다.\n1일 최대 4그램 (8정)을 초과하여 복용하지 않는다.\n\n"+
                          "이 약에 과민증 환자, 위장관궤양, 위장관출혈, 심한 혈액이상, 심한 간장애, 심한 신장장애, 심한 심장기능부전, 심한 고혈압, 기관지천식, 아스피린 또는 다른 소염진통제에 의한 천식, 두드러기, 알레르기 반응 경험 환자, 심장동맥 우회로술 전후 통증발생 환자, 임신 말기 3개월 기간의 임부, 수유부, 항암요법으로 고용량 메토트렉세이트를 투여 중인 환자, 갈락토오스 불내성, Lapp 유당분해효소 결핍증 또는 포도당-갈락토오스 흡수장애 등의 유전적인 문제가 있는 환자는 이 약을 복용하지 마십시오.\n"+
                          "권장용량을 초과하여 복용하지 마십시오.\n"+
                          "이 약을 복용하기 전에 혈액이상, 출혈경향 환자, 간경화, 간장애, 신장장애, 심장기능부전, 심질환, 고혈압, 전신홍반루푸스, 혼합결합조직질환, 궤양성대장염, 크론병, 노인, 만 2세 미만의 소아, 임부, 수두 환자는 의사 또는 약사와 상의하십시오.\n"+
                          "감기에 복용할 경우에는 원칙적으로 5일 이내로 복용하며 의사 또는 약사의 지시 없이 통증에 10일 이상(성인) 또는 5일 이상(소아) 복용하지 않고 발열에 3일 이상 복용하지 않습니다.",
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
                        "https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=202106092",
                        forceWebView: true, //인앱 브라우저로 열기
                        forceSafariVC: true);
                  },
                  icon: Icon(Icons.add, size: 18),
                  label: Text("더 알아보기"),
                  style: ElevatedButton.styleFrom( primary: Color(0xffff8787), onPrimary: Colors.white),
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
