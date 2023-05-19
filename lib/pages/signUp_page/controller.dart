import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:minto/constants/shared_pref_constants.dart';
import 'package:minto/services/authentication_services.dart';
import 'package:minto/services/database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signuppage_index.dart';

class SignUpPageController extends GetxController {
  SignUpPageController();
  final state = SignUpPageState();

  Future SignUp() async {
    if (state.formkey.currentState!.validate()) {
      state.isLoading.value = true;
      final sf = await SharedPreferences.getInstance();

      try {
        await AuthService()
            .createUser(state.email.text.trim(), state.password.text.trim());
        final newDoc = DatabaseService.userCollection.doc();
        await DatabaseService.userCollection.doc(newDoc.id).set({
          'name': state.name.text,
          'email': state.email.text,
          'password': state.password.text,
          'isAdmin': 'false',
        });

        await sf.setString(SharedPrefStrings.EMAIL, state.email.text.trim());
        await sf.setString(
            SharedPrefStrings.PASSWORD, state.password.text.trim());
        await sf.setString(SharedPrefStrings.NAME, state.name.text.trim());
        await sf.setBool(SharedPrefStrings.ISADMIN, false);
      } on FirebaseAuthException catch (e) {
        print(e);
        await sf.setString(SharedPrefStrings.EMAIL, '');
        await sf.setString(SharedPrefStrings.PASSWORD, '');
        await sf.setString(SharedPrefStrings.NAME, '');
        await sf.setBool(SharedPrefStrings.ISADMIN, false);

        Get.showSnackbar(GetSnackBar(
          title: 'Oh Oh!',
          message: e.toString().substring(
              e.toString().indexOf('/') + 1, e.toString().indexOf(']')),
          duration: 5000.milliseconds,
        ));
      } catch (e) {
        print(e);
      } finally {
        state.isLoading.value = false;
      }
    }
  }
}
