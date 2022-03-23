import 'package:flutter/material.dart';
import 'package:care_me/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';

class Cold3 extends StatefulWidget {
  const Cold3({Key? key}) : super(key: key);

  @override
  State<Cold3> createState() => _Cold3State();
}

class _Cold3State extends State<Cold3> {
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
                  "medicine_img/판피린.jpg",
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
                    '<판피린큐>',
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
                          "이 약은 감기의 여러 증상(콧물, 코막힘, 재채기, 인후통, 기침, 가래, 오한, 발열, 두통, 관절통, 근육통)의 완화에 사용합니다.",
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
                          "성인 1회 1병(20 mL)을 1일 3회 식후 30분에 복용합니다.\n"+
                          "매일 세잔 이상 정기적 음주자가 이 약 또는 다른 해열진통제를 복용할 때는 의사 또는 약사와 상의하십시오. 간손상을 일으킬 수 있습니다.\n"+
                          "매우 드물게 치명적일 수 있는 급성전신발진고름물집증, 스티븐스- 존슨증후군, 독성표피괴사용해와 같은 중대한 피부반응이 보고되었고 이 약 복용 후 피부발진 또는 다른 과민반응의 징후가 나타나는 경우 즉시 복용을 중단하십시오.\n"+
                          "아세트아미노펜으로 일일 최대 용량(4,000 mg)을 초과하여 복용하지 마십시오. 간손상을 일으킬 수 있습니다. 아세트아미노펜을 포함하는 다른 제품과 함께 복용하지 마십시오.",
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
                        "https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=200700547",
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
