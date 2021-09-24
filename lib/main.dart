import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/colors/colors.dart';
import 'app/routes/app_pages.dart';
import 'app/store/initial_binding.dart';
import 'app/utils/global.dart';

// 83860506 123456

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "swapapp",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: InitialBinding(),
      defaultTransition: Transition.rightToLeft,
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        brightness: Brightness.light,
        primaryColor: Colours.app_main,
      ),
      routingCallback: (routing) {
        if (routing!.current == '/home') {
          print("监听路由");
        }
      },
    );
  }
}
