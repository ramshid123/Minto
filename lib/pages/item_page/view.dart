import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:minto/constants/color_constants.dart';
import 'package:minto/pages/item_page/controller.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemPage extends GetView<ItemPageController> {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.yellowColor,
      extendBody: true,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () => Get.back(),
                        child: Icon(Icons.navigate_before),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstants.blackColor,
                            foregroundColor: ColorConstants.whiteColor,
                            shape: CircleBorder(),
                            fixedSize: Size(50.w, 50.h)),
                      ),
                    ),
                    Text(
                      Get.arguments['name'],
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontSize: 30.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Expanded(
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: ColorConstants.blackColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.r),
                                topRight: Radius.circular(30.r))),
                        child: Column(
                          children: [
                            SizedBox(height: 50.h),
                            Image.network(
                              Get.arguments['url'],
                              width: Get.width - 100.w,
                              height: 220.h,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 30.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    SizedBox(width: 7.w),
                                    Text(
                                      '15 min',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    SizedBox(width: 7.w),
                                    Text(
                                      '4.8',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 30.h),
                            Container(
                              height: 1,
                              width: Get.width - 100.w,
                              color: ColorConstants.yellowColor,
                            ),
                            SizedBox(height: 30.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontSize: 17.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () =>
                                      controller.decreamentQuantity(),
                                  child: Icon(Icons.remove),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          ColorConstants.blackColor,
                                      foregroundColor:
                                          ColorConstants.whiteColor,
                                      elevation: 0,
                                      fixedSize: Size(50.w, 50.h),
                                      shape: CircleBorder(),
                                      side: BorderSide(
                                          color: ColorConstants.yellowColor,
                                          width: 2.w)),
                                ),
                                SizedBox(
                                    width: 70.w,
                                    child: TextFormField(
                                      readOnly: true,
                                      showCursor: false,
                                      controller: controller.state.quantity,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: ColorConstants.whiteColor,
                                          fontSize: 30.sp),
                                      keyboardType: TextInputType.number,
                                    )),
                                ElevatedButton(
                                  onPressed: () =>
                                      controller.increamentQuantity(),
                                  child: Icon(Icons.add),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          ColorConstants.yellowColor,
                                      foregroundColor:
                                          ColorConstants.whiteColor,
                                      elevation: 0,
                                      fixedSize: Size(50.w, 50.h),
                                      shape: CircleBorder()),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            height: 80.h,
            width: Get.width,
            decoration: BoxDecoration(
                color: ColorConstants.yellowColor,
                borderRadius: BorderRadius.circular(40.r)),
            child: Obx(() {
              return Row(
                children: [
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Grand Total',
                        style: TextStyle(
                          color: ColorConstants.blackColor,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Obx(() {
                        return Text(
                          '₹ ${controller.state.total.value}',
                          // '₹ ${double.parse(doc['price'])*int.parse(controller.state.quantity.text)}',
                          style: TextStyle(
                            color: ColorConstants.blackColor,
                            fontSize: 28.sp,
                          ),
                        );
                      }),
                    ],
                  ),
                  Spacer(),
                  controller.state.isLoading.value
                      ? SizedBox(
                          width: 180.w,
                          height: 60.h,
                          child: Center(
                            child: SizedBox(
                              width: 60.w,
                              height: 60.h,
                              child: CircularProgressIndicator(
                                strokeWidth: 5.w,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : ElevatedButton(
                          // onPressed: () {},
                          onPressed: () async => await controller.placeOrder(),
                          child: Text(
                            'Buy Now',
                            style: TextStyle(
                              color: ColorConstants.whiteColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstants.blackColor,
                              foregroundColor: ColorConstants.whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                              fixedSize: Size(180.w, 60.h)),
                        )
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
