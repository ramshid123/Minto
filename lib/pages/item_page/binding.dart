import 'package:get/get.dart';
import 'itempage_index.dart';


class ItemPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ItemPageController>(ItemPageController());
  }
}
