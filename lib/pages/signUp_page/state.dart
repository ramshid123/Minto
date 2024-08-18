import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpPageState {
  final formkey = GlobalKey<FormState>();

  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();

  var isLoading = false.obs;
}
