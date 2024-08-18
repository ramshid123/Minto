import 'package:get/get.dart';
import 'package:minto/routes/names.dart';
import 'package:minto/services/database_service.dart';
import 'itempage_index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemPageController extends GetxController {
  ItemPageController();
  final state = ItemPageState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    state.quantity.text = '1';
    state.total.value = double.parse(Get.arguments['price'].toString()) *
        int.parse(state.quantity.text);
    ;
  }

  void increamentQuantity() {
    if (state.quantity.text == '') {
      state.quantity.text = 1.toString();
      state.total.value = double.parse(Get.arguments['price'].toString()) *
          int.parse(state.quantity.text);
    } else {
      state.quantity.text = (int.parse(state.quantity.text) + 1).toString();
      state.total.value = double.parse(Get.arguments['price'].toString()) *
          int.parse(state.quantity.text);
    }
  }

  void decreamentQuantity() {
    if (int.parse(state.quantity.text) > 1) {
      state.quantity.text = (int.parse(state.quantity.text) - 1).toString();
      state.total.value = double.parse(Get.arguments['price'].toString()) *
          int.parse(state.quantity.text);
    }
  }

  Future placeOrder() async {
    state.isLoading.value = true;
    try {
      final snapshot = await DatabaseService.TableCollection.where('index',
              isEqualTo: Get.arguments['tableindex'].toString())
          .get();
      if (int.parse(snapshot.docs.single.data()['taken']) <
          int.parse(snapshot.docs.single.data()['max'])) {
        final doc_id = snapshot.docs.single.id;
        final takenValue = int.parse(snapshot.docs.single.data()['taken']);
        await DatabaseService.TableCollection.doc(doc_id).update({
          'taken': (takenValue + 1).toString(),
        });
        Get.toNamed(AppRouteNames.ORDER_COMPLETE_PAGE, arguments: doc_id);
      }
      else{
        Get.showSnackbar(GetSnackBar(
          title: 'Sorry!!',
          message: 'This table is currently full',
          duration: 3.seconds,
        ));
        Get.offAllNamed(AppRouteNames.TABLE_PAGE);
      }
    } catch (e) {
      print(e);
    } finally {
      state.isLoading.value = false;
    }
  }
}
