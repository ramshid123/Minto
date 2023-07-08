import 'package:get/get.dart';
import 'package:minto/pages/home_page/homepage_index.dart';
import 'package:minto/pages/item_page/itempage_index.dart';
import 'package:minto/pages/order_complete/ordercompletepage_index.dart';
import 'package:minto/pages/signUp_page/signuppage_index.dart';
import 'package:minto/pages/signIn_page/loginpage_index.dart';
import 'package:minto/pages/splash_screen/view.dart';
import 'package:minto/pages/table_page/tablepage_index.dart';

import 'names.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: AppRouteNames.LOGIN_PAGE,
      page: () => LoginPage(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: AppRouteNames.SIGN_UP_PAGE,
      page: () => SignUpPage(),
      binding: SignUpPageBinding(),
    ),
    GetPage(
      name: AppRouteNames.TABLE_PAGE,
      page: () => TablePage(),
      binding: TablePageBinding(),
    ),
    GetPage(
      name: AppRouteNames.HOME_PAGE,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: AppRouteNames.ITEM_PAGE,
      page: () => ItemPage(),
      binding: ItemPageBinding(),
    ),
    GetPage(
      name: AppRouteNames.ORDER_COMPLETE_PAGE,
      page: () => OrderCompletePage(),
      binding: OrderCompletePageBinding(),
    ),
    GetPage(
      name: AppRouteNames.SPLASH_SCREEN,
      page: () => SplashScreen(),
    ),
  ];
}
