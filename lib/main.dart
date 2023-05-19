import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minto/constants/color_constants.dart';
import 'package:minto/firebase_options.dart';
import 'package:minto/services/authentication_services.dart';
import 'routes/routes.dart';
import 'routes/names.dart';
import 'package:get/get.dart';

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
    return GetMaterialApp(
      onReady: () async => AuthService().changeForAuthChange(),
      title: 'Minto',
      initialRoute: AppRouteNames.SPLASH_SCREEN,
      getPages: AppRoutes.pages,
    );
  }
}
