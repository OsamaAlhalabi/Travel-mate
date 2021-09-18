import 'package:book_now_null_safety/screens/home_page.dart';
import 'package:book_now_null_safety/translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/search_controller.dart';
import 'controllers/theme_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SearchController());
    return GetMaterialApp(
        translations: Translation(),
        locale: Locale('en'),
        fallbackLocale: Locale('en'),
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeService().theme,
        home: HomePage());
  }
}
