import 'package:flutter/material.dart';
import 'package:care_me/screens/home.dart';

class PharmacyMap extends StatefulWidget {
  const PharmacyMap({Key? key}) : super(key: key);

  @override
  State<PharmacyMap> createState() => _PharmacyMapState();
}

class _PharmacyMapState extends State<PharmacyMap> {
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
