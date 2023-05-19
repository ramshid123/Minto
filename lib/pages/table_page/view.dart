import 'package:flutter/material.dart';
import 'package:minto/constants/color_constants.dart';
import 'package:get/get.dart';
import 'package:minto/pages/table_page/controller.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:minto/routes/names.dart';
import 'package:minto/services/database_service.dart';

class TablePage extends GetView<TablePageController> {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        text: 'Choose your seat,\nTaste your ',
                        children: [
                          TextSpan(
                              text: 'feast.',
                              style:
                                  TextStyle(color: ColorConstants.yellowColor)),
                        ],
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 1,
                          color: ColorConstants.whiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      KPeopleNumberButton(
                          controller: controller, index: 0, number: 2),
                      KPeopleNumberButton(
                          controller: controller, index: 1, number: 4),
                      KPeopleNumberButton(
                          controller: controller, index: 2, number: 8),
                    ],
                  ),
                  SizedBox(height: 30),
                  controller.state.peopleNumberSelectButtonIndex.value == 0
                      ? SizedBox(
                          height: Get.height - 300,
                          child: FirestoreListView(
                            physics: BouncingScrollPhysics(),
                            pageSize: 4,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            query: controller.state.query,
                            itemBuilder: (context, doc) => KTable2People(
                              number: int.parse(doc.data()['index']),
                              takenSeats: int.parse(doc.data()['taken']),
                              context: context,
                              controller: controller,
                              isAvailable: controller.CheckIsAvailable(
                                  max: 2,
                                  index: int.parse(doc.data()['index']),
                                  taken: int.parse(doc.data()['taken'])),
                            ),
                          ),
                        )
                      : (controller.state.peopleNumberSelectButtonIndex.value ==
                              1
                          ? SizedBox(
                              height: Get.height - 300,
                              child: FirestoreListView(
                                physics: BouncingScrollPhysics(),
                                pageSize: 4,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                query: controller.state.query,
                                itemBuilder: (context, doc) => KTable4People(
                                  number: int.parse(doc.data()['index']),
                                  takenSeats: int.parse(doc.data()['taken']),
                                  context: context,
                                  controller: controller,
                                  isAvailable: controller.CheckIsAvailable(
                                      max: 4,
                                      index: int.parse(doc.data()['index']),
                                      taken: int.parse(doc.data()['taken'])),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: Get.height - 300,
                              width: Get.width,
                              child: FirestoreListView(
                                physics: BouncingScrollPhysics(),
                                pageSize: 4,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                query: controller.state.query,
                                itemBuilder: (context, doc) => KTable8People(
                                  number: int.parse(doc.data()['index']),
                                  takenSeats: int.parse(doc.data()['taken']),
                                  context: context,
                                  controller: controller,
                                  isAvailable: controller.CheckIsAvailable(
                                      max: 8,
                                      index: int.parse(doc.data()['index']),
                                      taken: int.parse(doc.data()['taken'])),
                                ),
                              ),
                            ))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

Widget KPeopleNumberButton(
    {required TablePageController controller,
    required int index,
    required int number}) {
  return Obx(() {
    return ElevatedButton(
      onPressed: () =>
          controller.changePeopleNumberButtonIndex(index: index, max: number),
      child: Text(
        '$number Seat',
        style: TextStyle(fontSize: 17),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size((Get.width / 3) - 20, 50),
        backgroundColor:
            controller.state.peopleNumberSelectButtonIndex.value == index
                ? ColorConstants.yellowColor
                : ColorConstants.greyColor,
        foregroundColor:
            controller.state.peopleNumberSelectButtonIndex.value == index
                ? ColorConstants.blackColor
                : ColorConstants.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  });
}

Widget KTable2People(
    {required int number,
    required TablePageController controller,
    required bool isAvailable,
    required int takenSeats,
    required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: takenSeats >= 1
                  ? ColorConstants.yellowColor
                  : ColorConstants.greyColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorConstants.yellowColor,
                width: 1,
              )),
        ),
        GestureDetector(
          onTap: () => controller.selectTableAndGoToHomePage(
              index: number, isAvailable: isAvailable, context: context),
          child: Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              color: isAvailable
                  ? ColorConstants.greyColor
                  : ColorConstants.yellowColor,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: ColorConstants.yellowColor, width: 2),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: isAvailable
                      ? ColorConstants.whiteColor
                      : ColorConstants.blackColor,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: takenSeats >= 2
                  ? ColorConstants.yellowColor
                  : ColorConstants.greyColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorConstants.yellowColor,
                width: 1,
              )),
        ),
      ],
    ),
  );
}

Widget KTable4People(
    {required int number,
    required TablePageController controller,
    required BuildContext context,
    required int takenSeats,
    required bool isAvailable}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 30),
    width: 140,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: takenSeats >= 1
                      ? ColorConstants.yellowColor
                      : ColorConstants.greyColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorConstants.yellowColor,
                    width: 1,
                  )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: takenSeats >= 2
                      ? ColorConstants.yellowColor
                      : ColorConstants.greyColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorConstants.yellowColor,
                    width: 1,
                  )),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => controller.selectTableAndGoToHomePage(
              index: number, isAvailable: isAvailable, context: context),
          child: Container(
            height: 150,
            width: 190,
            decoration: BoxDecoration(
              color: isAvailable
                  ? ColorConstants.greyColor
                  : ColorConstants.yellowColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorConstants.yellowColor, width: 2),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: isAvailable
                      ? ColorConstants.whiteColor
                      : ColorConstants.blackColor,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: takenSeats >= 3
                      ? ColorConstants.yellowColor
                      : ColorConstants.greyColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorConstants.yellowColor,
                    width: 1,
                  )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: takenSeats >= 4
                      ? ColorConstants.yellowColor
                      : ColorConstants.greyColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorConstants.yellowColor,
                    width: 1,
                  )),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget KTable8People(
    {required int number,
    required TablePageController controller,
    required int takenSeats,
    required BuildContext context,
    required bool isAvailable}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 30),
    width: 300,
    height: 300,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: takenSeats >= 1
                      ? ColorConstants.yellowColor
                      : ColorConstants.greyColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorConstants.yellowColor,
                    width: 1,
                  )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: takenSeats >= 2
                      ? ColorConstants.yellowColor
                      : ColorConstants.greyColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorConstants.yellowColor,
                    width: 1,
                  )),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: takenSeats >= 3
                          ? ColorConstants.yellowColor
                          : ColorConstants.greyColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorConstants.yellowColor,
                        width: 1,
                      )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: takenSeats >= 4
                          ? ColorConstants.yellowColor
                          : ColorConstants.greyColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorConstants.yellowColor,
                        width: 1,
                      )),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => controller.selectTableAndGoToHomePage(
                  index: number, isAvailable: isAvailable, context: context),
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: ColorConstants.yellowColor, width: 2),
                  borderRadius: BorderRadius.circular(50),
                  color: isAvailable
                      ? ColorConstants.greyColor
                      : ColorConstants.yellowColor,
                ),
                child: Center(
                  child: Text(
                    number.toString(),
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: isAvailable
                          ? ColorConstants.whiteColor
                          : ColorConstants.blackColor,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: takenSeats >= 5
                          ? ColorConstants.yellowColor
                          : ColorConstants.greyColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorConstants.yellowColor,
                        width: 1,
                      )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: takenSeats >= 6
                          ? ColorConstants.yellowColor
                          : ColorConstants.greyColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorConstants.yellowColor,
                        width: 1,
                      )),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: takenSeats >= 7
                      ? ColorConstants.yellowColor
                      : ColorConstants.greyColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorConstants.yellowColor,
                    width: 1,
                  )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: takenSeats >= 8
                      ? ColorConstants.yellowColor
                      : ColorConstants.greyColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorConstants.yellowColor,
                    width: 1,
                  )),
            ),
          ],
        ),
      ],
    ),
  );
}
