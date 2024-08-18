import 'package:get/get.dart';
import 'tablepage_index.dart';


class TablePageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<TablePageController>(TablePageController());
  }
}
