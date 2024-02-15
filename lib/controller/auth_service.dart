import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('users');
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    try {
      // 구글 로그인을 통해 사용자 정보를 가져옵니다.
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleAuth = await googleSignInAccount.authentication;

        // GoogleAuthProvider를 사용하여 구글 사용자 정보로 사용자를 인증합니다.
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // 인증된 사용자 정보를 Firebase에 저장합니다.
        UserCredential userCredential = await _auth.signInWithCredential(credential);
        User? user = userCredential.user;

        // 사용자 정보 Firestore에 저장
        if (user != null) {
          await _usersCollection.doc(user.uid).set({
            'uid': user.uid, // 사용자 uid 저장
            'email': user.email,
            // 다른 사용자 정보도 추가할 수 있음
          });
        }
      }
    } catch (e) {
      print('Error signing in with Google: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
