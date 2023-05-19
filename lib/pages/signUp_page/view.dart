import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:minto/pages/signIn_page/loginpage_index.dart';
import 'package:minto/pages/signUp_page/controller.dart';
import 'package:minto/constants/color_constants.dart';
import 'package:minto/routes/names.dart';

class SignUpPage extends GetView<SignUpPageController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blackColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          width: Get.width,
          child: SingleChildScrollView(
            child: Form(
              key: controller.state.formkey,
              child: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 35),
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
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 30,
                          color: ColorConstants.whiteColor.withOpacity(0.8),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    KLoginTextForm('Name', controller.state.name),
                    SizedBox(height: 10),
                    KLoginTextForm('Email', controller.state.email),
                    SizedBox(height: 10),
                    KLoginTextForm('Password', controller.state.password),
                    SizedBox(height: 40),
                    controller.state.isLoading.value
                        ? SizedBox(
                            height: 70,
                            width: 70,
                            child: CircularProgressIndicator(
                              color: ColorConstants.yellowColor,
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () async => controller.SignUp(),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: ColorConstants.blackColor,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(Get.width / 2, 70),
                                backgroundColor: ColorConstants.yellowColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                    SizedBox(height: 20),
                    Text.rich(TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: ColorConstants.whiteColor,
                        ),
                        children: [
                          TextSpan(
                              text: 'Login',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    Get.offAllNamed(AppRouteNames.LOGIN_PAGE),
                              style: TextStyle(
                                color: ColorConstants.yellowColor,
                              ))
                        ])),
                    SizedBox(height: 20),
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
