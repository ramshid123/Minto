import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:minto/constants/color_constants.dart';
import 'package:minto/pages/home_page/controller.dart';
import 'package:minto/routes/names.dart';
import 'package:minto/services/authentication_services.dart';
import 'package:minto/services/database_service.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({super.key});

  final int tableIndex = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () async {
                          Get.defaultDialog(
                            backgroundColor: ColorConstants.blackColor,
                              title: 'Logout?',
                              titleStyle: TextStyle(
                                color: ColorConstants.whiteColor,
                              ),
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async =>
                                        await AuthService().logout(),
                                    child: Text('Yes'),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(100, 50),
                                      foregroundColor:
                                          ColorConstants.blackColor,
                                      backgroundColor:
                                          ColorConstants.yellowColor,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => Get.back(),
                                    child: Text('No'),
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size(100, 50),
                                        foregroundColor:
                                            ColorConstants.whiteColor,
                                        backgroundColor:
                                            ColorConstants.blackColor,
                                        side: BorderSide(
                                          color: ColorConstants.yellowColor,
                                        )),
                                  ),
                                ],
                              ));
                        },
                        child: Icon(Icons.menu),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: ColorConstants.blackColor,
                          foregroundColor: ColorConstants.whiteColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() {
                              return Text(
                                'Hi ${controller.state.name.value}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: ColorConstants.whiteColor
                                      .withOpacity(0.8),
                                ),
                              );
                            }),
                            SizedBox(height: 10),
                            Text(
                              'Hungry Now?',
                              style: TextStyle(
                                fontSize: 27,
                                color: ColorConstants.whiteColor,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: ColorConstants.yellowColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorConstants.greyColor,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        suffixIcon: Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                        hintText: 'Search.. ',
                        hintStyle: TextStyle(
                            color: ColorConstants.whiteColor.withOpacity(0.6)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = controller.state.categoryies[index];
                    return KCategoryButton(
                      controller: controller,
                      index: index,
                      name: item['name']!,
                      url: item['url']!,
                    );
                  },
                  itemCount: controller.state.categoryies.length,
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Items',
                    style: TextStyle(
                      fontSize: 30,
                      color: ColorConstants.whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GetBuilder(
                  init: controller,
                  builder: (ctrl) {
                    return SizedBox(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final item = ctrl.state.demoItems[
                                ctrl.state.selectedCategoryIndex.value][index];
                            return KItemButton(
                              name: item[0],
                              tableIndex: tableIndex,
                              url: item[1],
                              price: int.parse(item[2]),
                            );
                          },
                          itemCount: ctrl.state.demoItems[0].length,
                        ));
                  }),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

Widget KCategoryButton(
    {required HomePageController controller,
    required int index,
    required String name,
    required String url}) {
  return Obx(() {
    return GestureDetector(
      onTap: () => controller.changeCategoryIndex(index),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 130,
        width: 100,
        decoration: BoxDecoration(
            color: index == controller.state.selectedCategoryIndex.value
                ? ColorConstants.yellowColor
                : ColorConstants.greyColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              url,
              height: 40,
              width: 40,
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                color: index == controller.state.selectedCategoryIndex.value
                    ? ColorConstants.blackColor
                    : ColorConstants.whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  });
}

Widget KItemButton(
    {required String name,
    required String url,
    required int price,
    required int tableIndex}) {
  return GestureDetector(
    onTap: () => Get.toNamed(AppRouteNames.ITEM_PAGE, arguments: {
      'name': name,
      'url': url,
      'price': price,
      'tableindex': tableIndex
    }),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 130,
      width: 280,
      decoration: BoxDecoration(
          color: ColorConstants.greyColor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            url,
            height: 180,
            width: 180,
          ),
          SizedBox(height: 15),
          Text(
            name,
            style: TextStyle(
              fontSize: 25,
              color: ColorConstants.whiteColor,
            ),
          )
        ],
      ),
    ),
  );
}
