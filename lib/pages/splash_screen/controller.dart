import 'package:get/get.dart';
import 'package:minto/constants/shared_pref_constants.dart';
import 'package:minto/routes/names.dart';
import 'package:minto/services/authentication_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splashscreen_index.dart';

class SplashScreenController extends GetxController {
  SplashScreenController();
  final state = SplashScreenState();

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    init();
  }

  Future init() async {
    // await Future.delayed(2.seconds);
  }
}
