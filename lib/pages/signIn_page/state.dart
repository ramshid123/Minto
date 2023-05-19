import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageState {
  final formkey = GlobalKey<FormState>();

  var email = TextEditingController();
  var password = TextEditingController();

  var isLoading = false.obs;
}
