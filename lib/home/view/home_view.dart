import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gdsc/commmon/component/layout/default_layout.dart';
import 'package:gdsc/commmon/const/colors.dart';
import 'package:gdsc/home/component/home_card.dart';
import 'package:gdsc/home/component/rank_card.dart';
import 'package:gdsc/map/map_recommend_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key ? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {



  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: BG_COLOR,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 90),
            Home_Card(
              height: 90,
              color: W_BOX_COLOR,
              child: Text("안녕하세요 HUFS님,\n플러깅하기 좋은 날입니다.",
                style: TextStyle(color:BODY_TEXT_COLOR,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,),
            ),

            SizedBox(height: 20),

            Home_Card(
              height: 90,
              onTap: (){},
              color: BOX_COLOR,
              child: Column(
                children: [
                  Flexible(
                    flex: 8,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("HUFS\nLv.2",
                              style: TextStyle(
                                  color: W_BOX_COLOR,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(color: W_BOX_COLOR, width: 3),
                                    right: BorderSide(color: W_BOX_COLOR ,width: 3)
                                )
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text("플러깅 하러가기",
                              style: TextStyle(
                                  color: W_BOX_COLOR,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("20\npoint",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(child: Container(
                    color: Colors.white,
                  ), flex: 2,)
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
              width: 330,
              height: 40,
              child: Text("주간랭킹",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),

            RankCard(),
            SizedBox(height: 8),
            RankCard(),
            SizedBox(height: 8),
            RankCard(),
            SizedBox(height: 8),
            RankCard(),
            SizedBox(height: 8),
            RankCard(),
            SizedBox(height: 8),

            SizedBox(height: 20),

            Home_Card(
              height: 90,
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => MapRecommendView()));

              },
              Decoimage: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "asset/map/mapex.png"
                  )),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: Container(
                    child: Center(
                      child: Text("산책로 찾기",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
