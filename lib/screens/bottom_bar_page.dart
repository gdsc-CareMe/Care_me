import 'package:flutter/material.dart';
import 'package:care_me/screens/home.dart';
import 'package:care_me/screens/alarm.dart';
import 'package:care_me/screens/pharmacy_map.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  //하단바 현재 번호
  int _currentindex = 0;

  //하단바 항목 리스트
  final List<Widget> _screen = [
    const Home(),
    const Alarm(),
    const PharmacyMap()
  ];

  void _onTap(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screen[_currentindex],
        bottomNavigationBar: SizedBox(
            height: 70,
            child: BottomNavigationBar(
              backgroundColor: Color(0xffff8787),
                selectedFontSize: 13.0,
                selectedItemColor: Colors.white,
                unselectedFontSize: 12.0,
                unselectedItemColor: Color(0xffffb1b1),
                type: BottomNavigationBarType.fixed,
                elevation: 5.0,
                onTap: _onTap,
                currentIndex: _currentindex,
                items: [
                  new BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_rounded,
                      size: 30,),
                    label: ("home")
                    ),
                  new BottomNavigationBarItem(
                    icon: Icon(
                      Icons.access_alarm_rounded,
                      size: 30,
                    ),
                    label: ("alarm")
                    ),
                  new BottomNavigationBarItem(
                    icon: Icon(
                      Icons.local_pharmacy_rounded,
                      size: 30,
                    ),
                    label: ("pharmacy")
                    )  
                

                ])));
  }
}
