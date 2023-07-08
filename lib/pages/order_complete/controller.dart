import 'package:get/get.dart';
import 'package:minto/routes/names.dart';
import 'package:minto/services/database_service.dart';
import 'ordercompletepage_index.dart';

class OrderCompletePageController extends GetxController {
  OrderCompletePageController();

  Future freeTheSeat() async {
    try {
      final snapshot =
          await DatabaseService.TableCollection.doc(Get.arguments).get();
      final takenValue = int.parse(snapshot.data()!['taken']);
      await DatabaseService.TableCollection.doc(Get.arguments).update({
        'taken': (takenValue - 1).toString(),
      });
      Get.offAllNamed(AppRouteNames.TABLE_PAGE);
    } catch (e) {
      print(e);
    }
  }
}
