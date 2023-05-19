import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:minto/constants/color_constants.dart';
import 'package:minto/pages/order_complete/controller.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
        body: SafeArea(
          child: SizedBox(
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Order Placed Successfully',
                  style: TextStyle(
                    color: ColorConstants.whiteColor,
                    fontSize: 27,
                  ),
                ).animate().fadeIn(duration: 1500.ms).moveY(
                    begin: 20, duration: 1500.ms, curve: Curves.easeInOut),
                SizedBox(height: 100),
                Text(
                  'When you had your meal..',
                  style: TextStyle(
                    color: ColorConstants.whiteColor,
                    fontSize: 22,
                  ),
                ).animate().fadeIn(duration: 1500.ms, delay: 1500.ms).moveY(
                    begin: 20,
                    duration: 1500.ms,
                    curve: Curves.easeInOut,
                    delay: 1500.ms),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async => controller.freeTheSeat(),
                  child: Text(
                    'Free the seat',
                    style: TextStyle(
                      color: ColorConstants.blackColor,
                      fontSize: 25,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.yellowColor,
                      foregroundColor: ColorConstants.blackColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      fixedSize: Size(200, 80)),
                ).animate().fadeIn(duration: 1500.ms, delay: 3000.ms).moveY(
                    begin: 20,
                    duration: 1500.ms,
                    curve: Curves.easeInOut,
                    delay: 3000.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
