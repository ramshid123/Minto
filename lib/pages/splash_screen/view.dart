import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:minto/constants/color_constants.dart';

class SplashScreen extends StatelessWidget {
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
            // Image.asset(
            //   'assets/ic_launcher.png',
            //   height: 250,
            //   width: 250,
            // ),
            SizedBox(
              height: 250.h,
              width: 250.w,
              child: RiveAnimation.asset(
                'assets/minto.riv',
                onInit: (p0) {
                  final ctrl = StateMachineController.fromArtboard(
                      p0, 'State Machine 1');
                  p0.addController(ctrl!);
                },
              ),
            ),
            Text(
              'Minto',
              style: TextStyle(
                fontSize: 50.sp,
                color: ColorConstants.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Taste with comfort',
              style: TextStyle(
                fontSize: 20.sp,
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
