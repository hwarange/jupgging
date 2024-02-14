import 'package:flutter/material.dart';
import 'package:gdsc/commmon/component/custom_text_form_field.dart';
import 'package:gdsc/commmon/component/layout/default_layout.dart';
import 'package:gdsc/commmon/const/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gdsc/home/view/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key ? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  bool isLoginView = true;
  final _fomKey = GlobalKey<FormState>();
  String userEmail = '';
  String userPassword = '';
  final _authentication = FirebaseAuth.instance;

  void _tryValidation() {
    final isValid = _fomKey.currentState!.validate();
    if(isValid){
      _fomKey.currentState!.save();
    }
  }


  @override
  Widget build(BuildContext context) {
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
                  keyboardType: TextInputType.emailAddress,
                  hintText: '이메일을 입력해주세요.',
                  onChanged: (String value)
                  {
                    userEmail = value;
                  },
                ),
                const SizedBox(height: 16.0,),
                CustomTextFormField(
                  hintText: '비밀번호를 입력해주세요.',
                  onChanged: (String value)
                  {
                    userPassword = value;
                  },
                  obscureText: true,
                ),
                const SizedBox(height: 16.0,),
                ElevatedButton(
                  onPressed: () async{
                    if(isLoginView){
                      _tryValidation();
                      try {
                        final newUser = await _authentication
                            .createUserWithEmailAndPassword(
                          email: userEmail,
                          password: userPassword,
                        );

                        if(newUser.user != null){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context){
                                return HomeView();
                              }
                              )
                          );
                        }
                      }catch(e){
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                Text('이메일이랑 비번을 확인바람'),
                                backgroundColor: Colors.blue,
                            ),
                        );
                      }
                  }
                    if (!isLoginView){
                      _tryValidation();

                      try{
                        final newUser =
                            await _authentication.signInWithEmailAndPassword(
                                email: userEmail,
                                password: userPassword,
                            );
                        if (newUser.user != null){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context){
                                    return HomeView();
                                  },
                              ),
                          );
                        }
                      }catch(e){
                        print(e);
                      }
                    }
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: BODY_TEXT_COLOR,
                    minimumSize:  const Size.fromHeight(50),
                  ),
                    child: Text(
                      '로그인',
                      style: TextStyle(
                        color: W_BOX_COLOR,
                      ),
                    ),
                ),
                const SizedBox(height: 16.0,),

                ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: BG_COLOR,
                    minimumSize:  const Size.fromHeight(50),
                  ),
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      color: W_BOX_COLOR,
                    )
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
