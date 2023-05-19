import 'package:get/get.dart';
import 'signuppage_index.dart';


class SignUpPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<SignUpPageController>(SignUpPageController());
  }
}
