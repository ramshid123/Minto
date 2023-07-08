import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minto/constants/color_constants.dart';
import 'package:minto/firebase_options.dart';
import 'package:minto/services/authentication_services.dart';
import 'routes/routes.dart';
import 'routes/names.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(App());
  });
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(411.42857142857144, 866.2857142857143),
        builder: (context, _) {
          return GetMaterialApp(
            onReady: () async => AuthService().changeForAuthChange(),
            theme: ThemeData(primarySwatch: Colors.amber).copyWith(
                primaryColor: ColorConstants.yellowColor,
                primaryColorLight: Color(0xfff2c616),
                primaryColorDark: Color(0xfff2c616)),
            title: 'Minto',
            initialRoute: AppRouteNames.SPLASH_SCREEN,
            getPages: AppRoutes.pages,
          );
        });
  }
}
