import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:minto/constants/shared_pref_constants.dart';
import 'package:minto/routes/names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static final auth = FirebaseAuth.instance;

  void changeForAuthChange() async {
    await Future.delayed(3.seconds);
    final sf = await SharedPreferences.getInstance();
    AuthService.auth.authStateChanges().listen((event) async {
      if (event == null) {
        Get.offAllNamed(AppRouteNames.LOGIN_PAGE);
      } else {
        Get.offAllNamed(AppRouteNames.TABLE_PAGE);
      }
    });
  }

  Future login(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future createUser(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future logout() async {
    await auth.signOut();
  }
}
