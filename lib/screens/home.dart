import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

import 'medicines/painkiller/med1.dart';
import 'medicines/painkiller/med2.dart';
import 'medicines/painkiller/med3.dart';
import 'medicines/painkiller/med4.dart';

import 'medicines/cold/cold1.dart';
import 'medicines/cold/cold2.dart';
import 'medicines/cold/cold3.dart';
import 'medicines/cold/cold4.dart';

import 'medicines/ointment/oint1.dart';
import 'medicines/ointment/oint2.dart';
import 'medicines/ointment/oint3.dart';
import 'medicines/ointment/oint4.dart';
import 'medicines/ointment/oint5.dart';

import 'medicines/digestive/dig1.dart';
import 'medicines/digestive/dig2.dart';
import 'medicines/digestive/dig3.dart';
import 'medicines/digestive/dig4.dart';
import 'medicines/digestive/dig5.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //버튼 스타일 지정
  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black,
    primary: Colors.white,
  );

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
            actions: [
            //로그아웃 버튼
            IconButton(
                onPressed: () async {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Login()));
                },
                color: Color(0xffff8787),
                icon: Icon(Icons.exit_to_app))
          ],
            centerTitle: true),
        body: Container(
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  //해열 진통제 카테고리
                  Text(
                    '해열 진통제',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 150.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal, //수평 스크롤
                      children: <Widget>[
                        ElevatedButton(
                            style: elevatedButtonStyle,
                            //버튼을 누르면 Med1 페이지로 이동
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Med1()));
                            },
                            child: Column(
                              children: [
                                //미리보기 사진과 이름 정보
                                Image.asset(
                                  "medicine_img/타이레놀.jpg",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('타이레놀',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                        ElevatedButton(
                            style: elevatedButtonStyle,
                            //Med2 페이지로 이동
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Med2()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/게보린.png",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('게보린',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                        ElevatedButton(
                            style: elevatedButtonStyle,
                            //Med3 페이지로 이동
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Med3()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/펜잘.jpg",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('펜잘',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                        ElevatedButton(
                            style: elevatedButtonStyle,
                            //Med4 페이지로 이동
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Med4()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/부루펜.jpg",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('부루펜',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                      ],
                    ),
                  ),

                  //소화제 카테고리
                  Text(
                    '소화제',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 150.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal, //수평 스크롤
                      children: <Widget>[
                        ElevatedButton(
                            style: elevatedButtonStyle,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Dig1()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/개비스콘.png",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('개비스콘',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                        ElevatedButton(
                            style: elevatedButtonStyle,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Dig2()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/베아제.png",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('베아제',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                            ElevatedButton(
                            style: elevatedButtonStyle,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Dig3()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/겔포스엠.jpg",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('겔포스엠',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                            ElevatedButton(
                            style: elevatedButtonStyle,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Dig4()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/까스앤프리.jpg",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('까스앤프리',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                            ElevatedButton(
                            style: elevatedButtonStyle,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Dig5()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/소하자임.jpg",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('소하자임',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                      ],
                    ),
                  ),

                  //상처 연고류 카테고리
                  Text(
                    '상처 연고류',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 150.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal, //수평 스크롤
                      children: <Widget>[
                        ElevatedButton(
                            style: elevatedButtonStyle,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Oint1()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/마데카솔.jpg",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('마데카솔',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                        ElevatedButton(
                            style: elevatedButtonStyle,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Oint2()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/후시딘.jpg",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('후시딘',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                            ElevatedButton(
                            style: elevatedButtonStyle,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Oint3()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/바스포.jpg",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('바스포',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                            ElevatedButton(
                            style: elevatedButtonStyle,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Oint4()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/에스로반.jpg",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('에스로반',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                            ElevatedButton(
                            style: elevatedButtonStyle,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Oint5()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/리도멕스.jpg",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('리도멕스',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                      ],
                    ),
                  ),

                  //종합 감기약 카테고리
                  Text(
                    '종합감기약',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 150.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal, //수평 스크롤
                      children: <Widget>[
                        ElevatedButton(
                            style: elevatedButtonStyle,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Cold1()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/판콜에스.jpg",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('판콜에스',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                        ElevatedButton(
                            style: elevatedButtonStyle,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Cold2()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/콜드에스.jpg",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('콜드에스',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                            ElevatedButton(
                            style: elevatedButtonStyle,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Cold3()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/판피린.jpg",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('판피린큐',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                            ElevatedButton(
                            style: elevatedButtonStyle,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Cold4()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "medicine_img/코푸시럽.jpg",
                                  width: 150.0,
                                  height: 100,
                                ),
                                Text('코푸시럽',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
