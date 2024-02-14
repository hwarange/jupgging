import 'package:flutter/material.dart';
import 'package:gdsc/home/view/home_screen.dart';

//import 'package:google_sign_in/google_sign_in.dart';
//import 'firebase_options.dart';
//import 'home/view/home_screen.dart';
//import 'map/map_recommend_view.dart';
//import 'user/view/login_view.dart';

void main() {
  runApp(Joop_App());
}



class Joop_App extends StatelessWidget {
  const Joop_App({Key ? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'NotoSans',
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen()
    );
  }
}