import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minto/constants/color_constants.dart';
import 'package:minto/routes/names.dart';
import 'package:minto/services/database_service.dart';
import 'tablepage_index.dart';

class TablePageController extends GetxController {
  TablePageController();
  final state = TablePageState();

  void changePeopleNumberButtonIndex({required int index, required int max}) {
    state.peopleNumberSelectButtonIndex.value = index;
    state.query =
        DatabaseService.TableCollection.where('max', isEqualTo: max.toString())
            .orderBy('index');
    ;
  }

  bool CheckIsAvailable(
      {required int max, required int index, required int taken}) {
    return taken < max ? true : false;
  }

  Future selectTableAndGoToHomePage(
      {required int index,
      required bool isAvailable,
      required BuildContext context}) async {
    try {
      final snapshot = await DatabaseService.TableCollection.where('index',
              isEqualTo: index.toString())
          .get();
      if (isAvailable) {
        Get.toNamed(AppRouteNames.HOME_PAGE, arguments: index);
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      } else {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: ColorConstants.greyColor,
            content: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Oh Oh!',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.whiteColor,
                        fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'This Table is already taken',
                    style: TextStyle(
                        color: ColorConstants.whiteColor, fontSize: 15),
                  )
                ],
              ),
            )));
      }
    } catch (e) {
      print(e);
    }
  }
}
