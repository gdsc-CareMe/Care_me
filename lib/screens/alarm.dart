import 'package:flutter/material.dart';
import 'package:care_me/screens/home.dart';

class Alarm extends StatefulWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Image.asset('image/logo.png', width: 53,),
            centerTitle: true
        ),
      body: SingleChildScrollView(
      ),
    );
  }
}
