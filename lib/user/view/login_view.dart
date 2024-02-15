import 'package:flutter/material.dart';
import 'package:gdsc/commmon/component/custom_text_form_field.dart';
import 'package:gdsc/commmon/component/layout/default_layout.dart';
import 'package:gdsc/commmon/const/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../controller/auth_controller.dart';

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
                    AuthController.instance.register(
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
                    AuthController.instance.register(
                        emailController.text.trim(), passwordController.text.trim());
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
                  onTap: (){
                    signInWithGoogle();
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



Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
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
