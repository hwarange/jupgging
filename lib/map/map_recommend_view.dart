import 'package:flutter/material.dart';
import 'package:gdsc/commmon/component/layout/default_layout.dart';
import 'package:gdsc/commmon/const/colors.dart';
import 'package:gdsc/home/component/home_card.dart';


class MapRecommendView extends StatefulWidget {

  const MapRecommendView({Key ? key}) : super(key: key);



  @override
  State<MapRecommendView> createState() => _MapRecommendViewState();
}

class _MapRecommendViewState extends State<MapRecommendView> {

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: BG_COLOR,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
            Container(
              padding: EdgeInsets.fromLTRB(40,10,10,10),
              child: Text("주변 산책로 추천",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Column(
                children: [
                  Home_Card(
                    height: 120,
                  ),
                  SizedBox(height: 20),
                  Home_Card(
                    height: 120,
                  ),
                  SizedBox(height: 20),
                  Home_Card(
                    height: 120,
                  ),
                  SizedBox(height: 20),
                  Home_Card(
                    height: 120,
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
