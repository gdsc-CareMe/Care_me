import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class Alarm extends StatefulWidget {
  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  FlutterLocalNotificationsPlugin? _flutterLocalNotificationsPlugin;
  DateTime _dateTime = DateTime.now();
  bool selected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationsPlugin!.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    tz.initializeTimeZones();
  }

  //알림창을 눌렀을 때
  Future<void> onSelectNotification(dynamic payload) async {
    debugPrint("$payload");
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('오늘의 알림'),
              content: Text('~건강 챙길 시간~'),
            ));
  }

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
          centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //시간 선택 스피너
            hourMinuteSecond(),

            //선택한 시간 확인
            new Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: new Text(
                _dateTime.hour.toString().padLeft(2, '0') +
                    '시  ' +
                    _dateTime.minute.toString().padLeft(2, '0') +
                    '분  ' +
                    _dateTime.second.toString().padLeft(2, '0') +
                    '초',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Text("후에 알림"),
            SizedBox(
              height: 30,
            ),

            //애니메이션 버튼
            GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                  _dailyAtTimeNotification();
                });
              },
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), //모서리를 둥글게
            border: Border.all(color: Colors.black12, width: 3)),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(
                      fontSize: 50.0,
                      color: selected ? Color.fromARGB(255, 193, 224, 151) : Color.fromARGB(255, 157, 178, 214),
                      fontWeight: selected ? FontWeight.bold : FontWeight.bold,
                    ),
                    child: Text('알림 예약'),
                  ),
                ),
              ),
            ),

            
          ],
        ),
      ),
    );
  }

  //시간 스피너 함수
  Widget hourMinuteSecond() {
    return new TimePickerSpinner(
      isShowSeconds: true,
      normalTextStyle: TextStyle(fontSize: 24, color: Colors.grey),
      highlightedTextStyle: TextStyle(fontSize: 24, color: Color(0xffff8585)),
      spacing: 50,
      minutesInterval: 1,
      secondsInterval: 1,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }

  //알림 함수
  Future<void> _dailyAtTimeNotification() async {
    await _flutterLocalNotificationsPlugin!.zonedSchedule(
        123,
        '오늘의 알림',
        '~건강 챙길 시간~',
        tz.TZDateTime.now(tz.local).add(Duration(
            hours: _dateTime.hour,
            minutes: _dateTime.minute,
            seconds: _dateTime.second)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}
