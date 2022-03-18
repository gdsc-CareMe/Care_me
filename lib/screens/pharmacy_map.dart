import 'package:flutter/material.dart';
import 'package:care_me/screens/home.dart';
//지도에 사용하는 dart파일들
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

//api활용에 사용하는 package
import 'package:care_me/pharmacy/ph.dart';
import 'package:care_me/pharmacy/ph_provider.dart';
import 'package:provider/provider.dart';

import 'dart:async';
import 'dart:math';

class PharmacyMap extends StatefulWidget {
  const PharmacyMap({Key? key}) : super(key: key);

  @override
  State<PharmacyMap> createState() => _PharmacyMapState();
}

class _PharmacyMapState extends State<PharmacyMap> {
  Completer<GoogleMapController> _controller = Completer();

  static CameraPosition _currentLocation = CameraPosition(
      target: LatLng(37.48926299528938, 127.08181088280385), zoom: 14);

  LatLng _center = LatLng(31.0, 51.0);

  final List<Marker> _markers = [];
  List<ph>? phs;

  _getCurrentPos() async {
    //현재위치  접근권한을 받기
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission == await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    //현재 위치 받는 코드 (현재 폐기상태 우측 상단에 구글 기본제공 내 위치로 가는 버튼이 있어서)
    //다른 기능 구현 후에 더 처리 해볼 예정
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    _currentLocation = CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 10);
  }

  PhProvider? _phProvider;

  //지도
  @override
  void initState() {
    _getCurrentPos();
    super.initState();
  }

  Widget build(BuildContext context) {
    // _phProvider = Provider.of<PhProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Image.asset(
            'image/logo.png',
            width: 53,
          ),
          centerTitle: true),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _currentLocation,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          addMarker(phs);
        },
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
      ),
    );
  }

  addMarker(ph _ph) {
    int id = Random().nextInt(100);

    _phProvider?.loadPhs(_center);

    _markers.add(Marker(
        position: LatLng(_ph.YPos!.toDouble(), _ph.XPos!.toDouble()),
        markerId: MarkerId(id.toString()),
        infoWindow: InfoWindow(
            title: '약국이름 : ${_ph.yadmNm}',
            snippet: '번호 : ${_ph.telno}\주소 : ${_ph.addr}')));
  }
}
