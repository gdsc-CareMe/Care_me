import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  LatLng addr = LatLng(0, 0);

  // 상태 관리
  // 주소를 받아 구독하고 있는 곳에 뿌려준다.
  getPosition(position) {
    addr = position;
    update();
  }
}
