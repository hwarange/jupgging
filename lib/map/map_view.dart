import 'package:flutter/material.dart';
import 'package:gdsc/commmon/component/layout/default_layout.dart';
import 'package:gdsc/commmon/const/colors.dart';
import 'package:gdsc/map/box_ex.dart';
import 'package:gdsc/map/running_box.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({Key ? key}) : super (key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.2250646, 126.9751430);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Polyline> _polylines = {};


  // 폴리라인 그리기
  void _createPolylines() {
    // 폴리라인 정보 설정
    Polyline polyline = Polyline(
      polylineId: PolylineId("home_to_station"),
      color: Colors.blue,
      width: 3,
      points: [
        LatLng(37.2250646, 126.9751430), // 우리집 좌표
        LatLng(37.267764, 127.000574), // 수원역 좌표
      ],
    );


    // 폴리라인 추가
    setState(() {
      _polylines.add(polyline);
    });
  }


  @override
  void initState() {
    super.initState();
    _createPolylines(); // 위젯이 생성될 때 폴리라인 생성
  }


  Widget build(BuildContext context) {
    return DefaultLayout(
        backgroundColor: BG_COLOR,
        child: Stack(
            children: [
              GoogleMap(
                onMapCreated: _onMapCreated,
                onTap: (argument) {},
                initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 14
                ),
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
                polylines: _polylines,


              ),
              Positioned(
                bottom: 30,
                  left: 30,
                  child: RunningBox1()),

            ]
        )
    );
  }
}
