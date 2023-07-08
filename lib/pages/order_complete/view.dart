import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:minto/constants/color_constants.dart';
import 'package:minto/pages/order_complete/controller.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rive/rive.dart';

class OrderCompletePage extends GetView<OrderCompletePageController> {
  const OrderCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorConstants.blackColor,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: 300.h,
                  width: 300.w,
                  child: RiveAnimation.asset(
                    'assets/food_anim.riv',
                  )),
              ElevatedButton(
                onPressed: () async => controller.freeTheSeat(),
                child: Text(
                  'Free the seat',
                  style: TextStyle(
                    color: ColorConstants.blackColor,
                    fontSize: 25.sp,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.yellowColor,
                    foregroundColor: ColorConstants.blackColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r)),
                    fixedSize: Size(200.w, 80.h)),
              ).animate(onPlay: (controller) {
                controller.repeat();
                controller.loop();
              }).flipV(begin: 0, end: 2, delay: 5000.ms, duration: 500.ms)
            ],
          ),
        ),
      ),
    );
  }
}


// ElevatedButton(
//                   onPressed: () async => controller.freeTheSeat(),
//                   child: Text(
//                     'Free the seat',
//                     style: TextStyle(
//                       color: ColorConstants.blackColor,
//                       fontSize: 25,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: ColorConstants.yellowColor,
//                       foregroundColor: ColorConstants.blackColor,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25)),
//                       fixedSize: Size(200, 80)),
//                 )