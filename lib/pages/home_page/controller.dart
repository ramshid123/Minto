import 'package:get/get.dart';
import 'package:minto/constants/shared_pref_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage_index.dart';

class HomePageController extends GetxController {
  HomePageController();
  final state = HomePageState();

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    final sf = await SharedPreferences.getInstance();
    state.name.value = sf.getString(SharedPrefStrings.NAME).toString();
  }

  void changeCategoryIndex(int index) {
    state.selectedCategoryIndex.value = index;
    update();
  }
}
