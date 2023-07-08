import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:minto/constants/color_constants.dart';
import 'package:minto/pages/home_page/controller.dart';
import 'package:minto/routes/names.dart';
import 'package:minto/services/authentication_services.dart';
import 'package:minto/services/database_service.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({super.key});

  final int tableIndex = Get.arguments;
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blackColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => focusNode.unfocus(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
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
                                        fixedSize: Size(100.w, 50.h),
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
                                          fixedSize: Size(100.w, 50.h),
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
                          child: Icon(Icons.logout),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: ColorConstants.blackColor,
                            foregroundColor: ColorConstants.whiteColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
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
                                    fontSize: 18.sp,
                                    color: ColorConstants.whiteColor
                                        .withOpacity(0.8),
                                  ),
                                );
                              }),
                              SizedBox(height: 10.h),
                              Text(
                                'Hungry Now?',
                                style: TextStyle(
                                  fontSize: 27.sp,
                                  color: ColorConstants.whiteColor,
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 25.r,
                            backgroundColor: ColorConstants.yellowColor,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      TextFormField(
                        focusNode: focusNode,
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
                              color:
                                  ColorConstants.whiteColor.withOpacity(0.6)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 120.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = controller.state.categoryies[index];
                      return KCategoryButton(
                        controller: controller,
                        index: index,
                        context: context,
                        name: item['name']!,
                        url: item['url']!,
                      );
                    },
                    itemCount: controller.state.categoryies.length,
                  ),
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      'Items',
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: ColorConstants.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                GetBuilder(
                    init: controller,
                    builder: (ctrl) {
                      return SizedBox(
                          height: 300.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final item = ctrl.state.demoItems[ctrl
                                  .state.selectedCategoryIndex.value][index];
                              return KItemButton(
                                name: item[0],
                                tableIndex: tableIndex,
                                context: context,
                                url: item[1],
                                price: int.parse(item[2]),
                              );
                            },
                            itemCount: ctrl.state.demoItems[0].length,
                          ));
                    }),
                SizedBox(height: 20.h),
              ],
            ),
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
    required BuildContext context,
    required String url}) {
  return FutureBuilder(
    future: precacheImage(NetworkImage(url), context),
    builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          height: 130.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: ColorConstants.greyColor,
              borderRadius: BorderRadius.circular(20.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70.h,
                width: 70.w,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(20)),
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .shimmer(delay: 500.ms, duration: 500.ms),
              SizedBox(height: 10),
              Container(
                height: 20.h,
                width: 70.w,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(20)),
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .shimmer(delay: 500.ms, duration: 500.ms),
            ],
          ),
        );
      } else if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error loading image'),
          );
        } else {
          return Obx(() {
            return GestureDetector(
              onTap: () => controller.changeCategoryIndex(index),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                height: 130.h,
                width: 100.w,
                decoration: BoxDecoration(
                    color: index == controller.state.selectedCategoryIndex.value
                        ? ColorConstants.yellowColor
                        : ColorConstants.greyColor,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      url,
                      height: 40.h,
                      width: 40.w,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: index ==
                                controller.state.selectedCategoryIndex.value
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
      } else {
        return Container();
      }
    },
  );
}

Widget KItemButton(
    {required String name,
    required BuildContext context,
    required String url,
    required int price,
    required int tableIndex}) {
  return FutureBuilder(
    future: precacheImage(NetworkImage(url), context),
    builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          height: 130.h,
          width: 280.w,
          decoration: BoxDecoration(
              color: ColorConstants.greyColor,
              borderRadius: BorderRadius.circular(20.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 160.h,
                width: 250.w,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(30)),
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .shimmer(delay: 500.ms, duration: 500.ms),
              SizedBox(height: 20),
              Container(
                height: 50.h,
                width: 250.w,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(30)),
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .shimmer(delay: 500.ms, duration: 500.ms),
            ],
          ),
        );
      } else if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error loading image'),
          );
        } else {
          return GestureDetector(
            onTap: () => Get.toNamed(AppRouteNames.ITEM_PAGE, arguments: {
              'name': name,
              'url': url,
              'price': price,
              'tableindex': tableIndex
            }),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              height: 130.h,
              width: 280.w,
              decoration: BoxDecoration(
                  color: ColorConstants.greyColor,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    url,
                    height: 180.h,
                    width: 180.w,
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: ColorConstants.whiteColor,
                    ),
                  )
                ],
              ),
            ),
          );
        }
      } else {
        return Container();
      }
    },
  );
}
