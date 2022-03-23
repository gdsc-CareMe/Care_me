import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:care_me/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';

class Med1 extends StatefulWidget {
  const Med1({Key? key}) : super(key: key);

  @override
  State<Med1> createState() => _Med1State();
}

class _Med1State extends State<Med1> {
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
          //뒤로 돌아가기 버튼
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              color: Colors.black,
              icon: Icon(Icons.arrow_back)),
        ),
        body: Container(
          //스크롤을 위해 ListView로 감싸줌
            child: ListView(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //해당 약품 이미지
              Center(
                child: Image.asset(
                  "medicine_img/타이레놀.jpg",
                  width: 300.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  //가로 여백
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    '<타이레놀>',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15, //세로 여백
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
                  //Right overflow by pixel을 방지하기 위해 Flexible(Card(...))의 구조를 사용
                  Flexible(
                      child: Card(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "이 약은 감기로 인한 발열 및 동통(통증), 두통, 신경통, 근육통, 월경통, 염좌통(삔 통증)과 치통, 관절통, 류마티양 동통(통증)에 사용합니다.",
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
                  //Right overflow by pixel을 방지하기 위해 Flexible(Card(...))의 구조를 사용
                  Flexible(
                      child: Card(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "만 12세 이상 소아 및 성인:\n1회 1~2정씩 1일 3-4회 (4-6시간 마다) 필요시 복용한다.\n1일 최대 4그램 (8정)을 초과하여 복용하지 않는다.\n"+
                          "매일 세잔 이상 정기적 음주자가 이 약 또는 다른 해열진통제를 복용할 때는 의사 또는 약사와 상의하십시오. 간손상을 일으킬 수 있습니다. " +
                              "매우 드물게 치명적일 수 있는 급성전신발진고름물집증, 스티븐스- 존슨증후군, 독성표피괴사용해와 " +
                              "같은 중대한 피부반응이 보고되었고 이 약 복용 후 피부발진 또는 다른 과민반응의 징후가 나타나는 경우 즉시 복용을 중단하십시오. " +
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
              //'더 알아보기' 버튼을 누르면 해당 약의 'e약은요' 사이트가 lauch됨
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
