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
              title: Text('Notification Payload'),
              content: Text('Payload: $payload'),
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
                    '시 ' +
                    _dateTime.minute.toString().padLeft(2, '0') +
                    '분' +
                    _dateTime.second.toString().padLeft(2, '0') +
                    '초',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Text("후에 알림"),
            SizedBox(height: 30,),

            //알림 예약 버튼
            ButtonTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minWidth: 180.0,
              height: 50.0,
              child: MaterialButton(
                color: const Color(0xffffb1b1),
                child: const Text(
                  '알림 예약',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                onPressed: () {
                  _dailyAtTimeNotification();
                },
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
