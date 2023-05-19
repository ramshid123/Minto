import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minto/constants/shared_pref_constants.dart';
import 'package:minto/routes/names.dart';
import 'package:minto/services/authentication_services.dart';
import 'package:minto/services/database_service.dart';
import 'loginpage_index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  LoginPageController();
  final state = LoginPageState();

  Future login() async {
    if (state.formkey.currentState!.validate()) {
      state.isLoading.value = true;
      final sf = await SharedPreferences.getInstance();

      try {
        final userInfoSnapshot = await DatabaseService.userCollection
            .where('email', isEqualTo: state.email.text.trim())
            .get();
        if (userInfoSnapshot.docs.isEmpty) {
          Get.showSnackbar(GetSnackBar(
            title: 'Invalid Email',
            message: 'This Email is not registered',
            duration: 5000.milliseconds,
          ));
          return;
        }
        final userInfo = userInfoSnapshot.docs.single.data();

        await sf.setString(SharedPrefStrings.EMAIL, userInfo['email']);
        await sf.setString(SharedPrefStrings.PASSWORD, userInfo['password']);
        await sf.setString(SharedPrefStrings.NAME, userInfo['name']);
        await sf.setBool(SharedPrefStrings.ISADMIN,
            userInfo['isAdmin'] == 'false' ? false : true);

        await AuthService()
            .login(state.email.text.trim(), state.password.text.trim());
      } on FirebaseAuthException catch (e) {
        print(e);
        await sf.setString(SharedPrefStrings.EMAIL, '');
        await sf.setString(SharedPrefStrings.PASSWORD, '');
        await sf.setString(SharedPrefStrings.NAME, '');
        await sf.setBool(SharedPrefStrings.ISADMIN, false);

        Get.showSnackbar(
          GetSnackBar(
            title: 'Oh Oh!',
            message: e.toString().substring(
                e.toString().indexOf('/') + 1, e.toString().indexOf(']')),
            duration: 5000.milliseconds,
          ),
        );
      } catch (e) {
        print(e);
      } finally {
        state.isLoading.value = false;
      }
    }
  }
}
