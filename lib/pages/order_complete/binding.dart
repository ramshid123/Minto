import 'package:get/get.dart';
import 'ordercompletepage_index.dart';


class OrderCompletePageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<OrderCompletePageController>(OrderCompletePageController());
  }
}
