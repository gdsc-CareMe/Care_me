import 'package:care_me/pharmacy/ph_repositiory.dart';
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

import 'package:care_me/pharmacy/ph_locationController.dart';
import 'package:get/get.dart';
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
      target: LatLng(36.7747747747747, 126.93671366081676), zoom: 14);

  final List<Marker> _markers = [];
  List<ph>? phs;
  late PhProvider _phProvider;

  //지도
  @override
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (controller) {
      var currentPosition = controller.addr;
      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      print(currentPosition);
      _currentLocation = CameraPosition(target: currentPosition, zoom: 15);
      _phProvider = Provider.of<PhProvider>(context, listen: false);
      _phProvider.loadPhs(currentPosition);

      return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Image.asset(
                'image/logo.png',
                width: 53,
              ),
              centerTitle: true),
          body: SafeArea(
            child: Consumer<PhProvider>(
              builder: (context, provider, wideget) {
                //map을 호출하기 전에 marker를 등록해주고 map을 호출해서 마커를 찍는다
                for (int i = 0; i < provider.phs.length; i++) {
                  print(
                      '************************addMark workding************************');
                  addMarker(provider.phs[i]);
                }
                if (provider.phs.isNotEmpty) {
                  return _makeMap();
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ));
    });
  }

  // Google Map 생성
  Widget _makeMap() {
    // print(phs);
    // for (int i = 0; i < phs.length; i++) {
    //   print('************************addMark workding************************');
    //   addMarker(phs[i]);
    // }

    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _currentLocation,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        // for (int i = 0; i < phs.length; i++) {
        //   print(
        //       '************************addMark workding************************');
        //   addMarker(phs[i]);
        // }
      },
      markers: _markers.toSet(),
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
    );
  }

  addMarker(ph _ph) {
    int id = Random().nextInt(100);
    //string은 null 형태일 수 없는데 ph안의 값은 nullable이니까
    //뒤에 !를 붙여서
    print(_ph.YPos);
    print(_ph.XPos);
    var yIsLat = double.parse(_ph.YPos!);

    var xIsLng = double.parse(_ph.XPos!);
    _markers.add(Marker(
        position: LatLng(yIsLat, xIsLng),
        markerId: MarkerId(id.toString()),
        infoWindow: InfoWindow(
            title: '약국이름 : ${_ph.yadmNm}',
            snippet: '번호 : ${_ph.telno}주소 : ${_ph.addr}')));
  }
}
