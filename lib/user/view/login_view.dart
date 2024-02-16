import 'package:flutter/material.dart';
import 'package:gdsc/commmon/component/custom_text_form_field.dart';
import 'package:gdsc/commmon/component/layout/default_layout.dart';
import 'package:gdsc/commmon/const/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gdsc/user/view/google_sign_up.dart';
import 'package:gdsc/user/view/sign_up.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../controller/auth_controller.dart';
import '../../home/view/home_screen.dart';

class LoginView extends StatelessWidget {
   LoginView({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return DefaultLayout(
      backgroundColor: Color(0xff81C784),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 90,
                ),
                _Title(),
                const SizedBox(
                  height: 90,
                ),
                CustomTextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: '이메일을 입력해주세요.',
                ),
                const SizedBox(height: 16.0,),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: '비밀번호를 입력해주세요.',
                  obscureText: true,
                ),
                const SizedBox(height: 16.0,),
                GestureDetector(
                  onTap: (){
                    AuthController.instance.login(
                        emailController.text.trim(), passwordController.text.trim());

                  },
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: BODY_TEXT_COLOR,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            '로그인',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => Sign_Up()
                    )
                    );
                  },
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: BG_COLOR,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            '회원가입',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: ()async {
                    // 구글 로그인 시도
                    final UserCredential userCredential = await signInWithGoogle();
                    // 구글 로그인 사용자의 이메일 가져오기
                    final String? userEmail = userCredential.user?.email;
                    // 이메일이 등록된 이메일인지 확인
                    final bool isEmailRegistered = await isEmailRegisteredInFirestore(userEmail!);
                    if (isEmailRegistered) {
                      // 이미 등록된 이메일인 경우, 홈 화면으로 이동
                      Get.offAll(() => HomeScreen());
                    } else {
                      // 등록되지 않은 이메일인 경우, 회원가입 화면으로 이동
                      Get.offAll(() => GoogleSignUp());
                    }
                  },
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: BODY_TEXT_COLOR,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'Google Sign in',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Joopging!',
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}





// 서브 필요한 경우
//class _SubTitle extends StatelessWidget {
  //const _SubTitle({Key ? key}) : super(key: key);


  //@override
  //Widget build(BuildContext context) {
    //return Text("필요한 경우 쓰세요.",
    //style: TextStyle(

    //),);
  //}
//}
