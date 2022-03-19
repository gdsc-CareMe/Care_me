import 'package:care_me/pharmacy/ph.dart';
import 'package:care_me/pharmacy/ph_repositiory.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PhProvider extends ChangeNotifier {
  //phRepository에 접근해서 데이터를 받아옴
  final ph_repositiory _phRepository = ph_repositiory();

  List<ph> _phs = [];
  List<ph> get phs => _phs;
  late LatLng _YX;

  //데이터로드
  loadPhs(LatLng num) async {
    List<ph>? listPhs = await _phRepository.loadPhs(num);
    print(listPhs);
    _phs = listPhs!;
    notifyListeners();
  }
}
