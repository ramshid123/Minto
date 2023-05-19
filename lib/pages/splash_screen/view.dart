import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:minto/constants/color_constants.dart';
import 'package:minto/pages/splash_screen/controller.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blackColor,
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/ic_launcher.png',
              height: 250,
              width: 250,
            ),
            Text(
              'Minto',
              style: TextStyle(
                fontSize: 50,
                color: ColorConstants.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Taste with comfort',
              style: TextStyle(
                fontSize: 20,
                color: ColorConstants.whiteColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
