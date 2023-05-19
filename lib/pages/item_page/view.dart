import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:minto/constants/color_constants.dart';
import 'package:minto/pages/item_page/controller.dart';

class ItemPage extends GetView<ItemPageController> {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.yellowColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Spacer(),
                Container(
                  height: Get.height * 0.75,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: ColorConstants.blackColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () => Get.back(),
                      child: Icon(Icons.navigate_before),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.blackColor,
                          foregroundColor: ColorConstants.whiteColor,
                          shape: CircleBorder(),
                          fixedSize: Size(50, 50)),
                    ),
                  ),
                  SizedBox(height: 15),
                  Image.network(
                    Get.arguments['url'],
                    width: Get.width - 150,
                  ),
                  SizedBox(height: 20),
                  Text(
                    Get.arguments['name'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          SizedBox(width: 7),
                          Text(
                            '15 min',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          SizedBox(width: 7),
                          Text(
                            '4.8',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Melting cheesy pizza Melting cheesy pizza Melting cheesy pizza Melting cheesy pizza Melting cheesy pizza ',
                    style: TextStyle(
                      color: ColorConstants.whiteColor.withOpacity(0.5),
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => controller.decreamentQuantity(),
                        child: Icon(Icons.remove),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstants.blackColor,
                            foregroundColor: ColorConstants.whiteColor,
                            elevation: 0,
                            fixedSize: Size(50, 50),
                            shape: CircleBorder(),
                            side: BorderSide(
                                color: ColorConstants.yellowColor, width: 2)),
                      ),
                      SizedBox(
                          width: 70,
                          child: TextFormField(
                            readOnly: true,
                            showCursor: false,
                            controller: controller.state.quantity,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorConstants.whiteColor, fontSize: 30),
                            keyboardType: TextInputType.number,
                          )),
                      ElevatedButton(
                        onPressed: () => controller.increamentQuantity(),
                        child: Icon(Icons.add),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstants.yellowColor,
                            foregroundColor: ColorConstants.whiteColor,
                            elevation: 0,
                            fixedSize: Size(50, 50),
                            shape: CircleBorder()),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 80,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: ColorConstants.yellowColor,
                      borderRadius: BorderRadius.circular(40)),
                  child: Obx(() {
                    return Row(
                      children: [
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Grand Total',
                              style: TextStyle(
                                color: ColorConstants.blackColor,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 5),
                            Obx(() {
                              return Text(
                                '₹ ${controller.state.total.value}',
                                // '₹ ${double.parse(doc['price'])*int.parse(controller.state.quantity.text)}',
                                style: TextStyle(
                                  color: ColorConstants.blackColor,
                                  fontSize: 28,
                                ),
                              );
                            }),
                          ],
                        ),
                        Spacer(),
                        controller.state.isLoading.value
                            ? SizedBox(
                                width: 180,
                                height: 60,
                                child: Center(
                                  child: SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 5,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : ElevatedButton(
                                // onPressed: () {},
                                onPressed: () async =>
                                    await controller.placeOrder(),
                                child: Text(
                                  'Buy Now',
                                  style: TextStyle(
                                    color: ColorConstants.whiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorConstants.blackColor,
                                    foregroundColor: ColorConstants.whiteColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    fixedSize: Size(180, 60)),
                              )
                      ],
                    );
                  }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Widget test() {
//   return Column(
//     children: [
//       ElevatedButton(
//         onPressed: () => controller.decreamentQuantity(),
//         child: Icon(Icons.remove),
//         style: ElevatedButton.styleFrom(
//             backgroundColor: ColorConstants.blachish_clr,
//             elevation: 0,
//             fixedSize: Size(50, 50),
//             shape: CircleBorder()),
//       ),
//       SizedBox(
//           width: 70,
//           child: TextFormField(
//             showCursor: false,
//             controller: controller.state.quantity,
//             textAlign: TextAlign.center,
//             style: TextStyle(color: ColorConstants.blachish_clr, fontSize: 30),
//             keyboardType: TextInputType.number,
//             onChanged: (val) {
//               controller.onQuantitiyChanges();
//             },
//           )),
//       ElevatedButton(
//         onPressed: () => controller.increamentQuantity(),
//         child: Icon(Icons.add, color: ColorConstants.blachish_clr),
//         style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             fixedSize: Size(50, 50),
//             shape: CircleBorder(),
//             side: BorderSide(color: ColorConstants.blachish_clr, width: 2)),
//       ),
//     ],
//   );
// }
