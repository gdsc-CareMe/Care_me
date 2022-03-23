import 'package:flutter/material.dart';
import 'package:care_me/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';

class Oint2 extends StatefulWidget {
  const Oint2({Key? key}) : super(key: key);

  @override
  State<Oint2> createState() => _Oint2State();
}

class _Oint2State extends State<Oint2> {
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
                  "medicine_img/후시딘.jpg",
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
                    '<후시딘>',
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
                          "이 약은 포도구균, 연쇄구균, 코리네박테륨, 클로스트리듐으로 인한 농가진, 감염성습진양피부염, 심상성여드름(보통여드름), 모낭염, 종기 및 종기증, 화농성한선염, 농가진성습진, 화상ㆍ외상ㆍ봉합창ㆍ식피창에 의한 2차 감염에 사용합니다.",
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
                          "환부를 깨끗이 하고 1일 1~2회 적당량을 환부에 직접 바르거나 무균거즈에 넓게 펴발라 붙입니다.\n1주 정도로 투여기간을 제한합니다.\n두껍게 바르지 않습니다.\n"+
                          "눈 또는 눈꺼풀과 같은 얼굴 안쪽에 사용하지 마십시오.\n이 약에 과민증 환자, 비감수성균(특히 녹농균)에 의한 감염환자는 사용하지 마십시오.\n"+
                          "이 약을 사용하기 전에 임부 또는 임신하고 있을 가능성이 있는 여성 및 수유부, 미숙아 및 신생아는 의사 또는 약사와 상의하십시오.\n이 약은 높은 투과흡수성을 가지므로 장기간 사용하지 마십시오.",
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
                        "https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=197900171",
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
