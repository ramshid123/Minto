import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:minto/pages/signIn_page/controller.dart';
import 'package:minto/constants/color_constants.dart';
import 'package:minto/routes/names.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blackColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          width: Get.width,
          child: SingleChildScrollView(
            child: Form(
              key: controller.state.formkey,
              child: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.h),
                    Image.asset(
                      'assets/ic_launcher.png',
                      height: 250.h,
                      width: 250.w,
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
                    SizedBox(height: 40.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: ColorConstants.whiteColor.withOpacity(0.8),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    KLoginTextForm('Email', controller.state.email),
                    SizedBox(height: 10.h),
                    KLoginTextForm('Password', controller.state.password),
                    SizedBox(height: 40.h),
                    controller.state.isLoading.value
                        ? SizedBox(
                            height: 70.h,
                            width: 70.w,
                            child: CircularProgressIndicator(
                              color: ColorConstants.yellowColor,
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () async => controller.login(),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: ColorConstants.blackColor,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(Get.width / 2, 70.h),
                                backgroundColor: ColorConstants.yellowColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r))),
                          ),
                    SizedBox(height: 20.h),
                    Text.rich(TextSpan(
                        text: 'Are you new here? ',
                        style: TextStyle(
                          color: ColorConstants.whiteColor,
                        ),
                        children: [
                          TextSpan(
                              text: 'Register',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    Get.offAllNamed(AppRouteNames.SIGN_UP_PAGE),
                              style: TextStyle(
                                color: ColorConstants.yellowColor,
                              ))
                        ])),
                    SizedBox(height: 20.h),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

Widget KLoginTextForm(String hint, TextEditingController ctrl) {
  return TextFormField(
    controller: ctrl,
    cursorColor: ColorConstants.yellowColor,
    style: TextStyle(
      color: ColorConstants.whiteColor,
    ),
    decoration: InputDecoration(
      filled: true,
      fillColor: ColorConstants.greyColor,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: ColorConstants.yellowColor,
          )),
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.blueGrey.shade500,
      ),
    ),
    validator: (val) {
      if (val!.isEmpty || val == null)
        return 'Required';
      else if (hint == 'Password' && val.length < 8)
        return 'Invalid Password';
      else if (hint == 'Email' && !GetUtils.isEmail(val))
        return 'Invalid Email';
    },
  );
}
