import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gdsc/commmon/component/layout/default_layout.dart';
import 'package:gdsc/commmon/const/colors.dart';
import 'package:gdsc/map/box_ex.dart';
import 'package:gdsc/map/running_box.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  final LatLng coordinates;
  final String name;

  const MapView({

    Key ? key,
    required this.coordinates,
    required this.name,

  }) : super (key: key);

  @override
  State<MapView> createState() => _MapViewState();
}
CollectionReference destinations = FirebaseFirestore.instance.collection('destinations');


class _MapViewState extends State<MapView> {
  final Set<Polyline> _polylines = {};
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(37.2250646, 126.9751430);


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }




  // 폴리라인 그리기
  void _createPolylines() {
    // 좌표가 있는지 확인
    // 폴리라인 그리기
    Polyline polyline = Polyline(
      polylineId: PolylineId("map_polyline"),
      color: Colors.blue,
      width: 3,
      points: [_center, widget.coordinates]
    );
    setState(() {
      _polylines.add(polyline);
    });
    }

    // 폴리라인 추가


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
                  child: RunningBox1(detinationName: widget.name)),

            ]
        )
    );
  }
}
