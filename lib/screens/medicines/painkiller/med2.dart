import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:care_me/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';

class Med2 extends StatefulWidget {
  const Med2({Key? key}) : super(key: key);

  @override
  State<Med2> createState() => _Med2State();
}

class _Med2State extends State<Med2> {
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
                  "medicine_img/게보린.png",
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
                    '<게보린>',
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
                          "이 약은 두통, 치통, 발치(이를 뽑음)후 동통(통증), 인후(목구멍)통, 귀의 통증, 관절통, 신경통, 요(허리)통, 근육통, 견통(어깨통증), 타박통, 골절통, 염좌통(삔 통증), 월경통(생리통), 외상(상처)통의 진통과 오한(춥고 떨리는 증상), 발열시의 해열에 사용합니다.",
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
                          "성인은 1회 1정 1일 3회까지 공복시를 피해 복용합니다.\n복용간격은 4시간 이상으로 합니다.\n이 약은 원칙적으로 단기간 복용합니다.\n\n"+
                          "이 약에 과민증 환자, 다른 해열진통제(비스테로이드성 소염제), 감기약 복용시 천식발작 유발 또는 그 경험자, 글루코스-6-인산 탈수소효소결핍증, 급성 간헐성(시간 간격을 두고 되풀이하여) 포르피린증, 과립백혈구감소증, 중증 간장애, 중증 신장애, 출혈 소인, 15세 미만의 소아, 소화성궤양, 심한 혈액 이상, 심한 심장기능저하, 바르비탈계 약물, 삼환계 항우울제, 알코올을 복용한 환자는 이 약을 복용하지 마십시오.\n" +
                              "이 약을 복용하기 전에 수두 또는 인플루엔자에 감염되어 있거나 또는 의심되는 15세 이상의 청소년, 갑상샘질환, 당뇨병, 고혈압, 몸이 약한 사람, 고열, 고령자, 임부 또는 임신하고 있을 가능성이 있는 여성, 수유부, 속쓰림, 위부불쾌감, 위통과 같은 위장문제가 지속 혹은 재발되는 사람, 간장애, 신장(콩팥)장애, 소화성궤양, 혈액이상, 출혈경향이 있는 환자, 심장기능이상, 기관지천식 환자는 의사 또는 약사와 상의하십시오.",
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
                        "https://nedrug.mfds.go.kr/searchEasyDrug/easyDetail?itemSeq=197900277",
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
