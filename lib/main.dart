
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gdsc/user/view/login_view.dart';
import 'package:get/get.dart';
import 'controller/auth_controller.dart';

//import 'package:google_sign_in/google_sign_in.dart';
//import 'firebase_options.dart';
//import 'home/view/home_screen.dart';
//import 'map/map_recommend_view.dart';
//import 'user/view/login_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const Joop_App());
}



class Joop_App extends StatelessWidget {
  const Joop_App({Key ? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'NotoSans',
        ),
        debugShowCheckedModeBanner: false,
        home: LoginView()
    );
  }
}