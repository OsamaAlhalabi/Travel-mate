import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Themes {

  static final lightTextTheme = Typography.material2018(
          platform:
              Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android)
      .black
      .merge(TextTheme(
        headline1: TextStyle(fontFamily: 'Signi'),
        headline2: TextStyle(fontFamily: 'Signi'),
        headline3: TextStyle(fontFamily: 'Signi'),
        headline4: TextStyle(fontFamily: 'Signi'),
        headline5: TextStyle(fontFamily: 'Signi'),
        headline6: TextStyle(fontFamily: 'Signi', color: Colors.white),
        subtitle1: TextStyle(fontFamily: 'Signi'),
        subtitle2: TextStyle(fontFamily: 'Signi'),
        caption: TextStyle(fontFamily: 'Signi'),
        bodyText2:
            TextStyle(fontFamily: 'Signi', fontSize: 14, letterSpacing: 0.25),
        bodyText1:
            TextStyle(fontFamily: 'Signi', fontSize: 16, letterSpacing: 0.5),
        button: TextStyle(fontFamily: 'Signi'),
        overline: TextStyle(fontFamily: 'Signi'),
      ));

  static final darkTextTheme = Typography.material2018(
          platform:
              Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android)
      .white
      .merge(TextTheme(
        headline1: TextStyle(fontFamily: 'Signi'),
        headline2: TextStyle(fontFamily: 'Signi'),
        headline3: TextStyle(fontFamily: 'Signi'),
        headline4: TextStyle(fontFamily: 'Signi'),
        headline5: TextStyle(fontFamily: 'Signi'),
        headline6: TextStyle(fontFamily: 'Signi'),
        subtitle1: TextStyle(fontFamily: 'Signi'),
        subtitle2: TextStyle(fontFamily: 'Signi'),
        caption: TextStyle(fontFamily: 'Signi'),
        bodyText2:
            TextStyle(fontFamily: 'Signi', fontSize: 14, letterSpacing: 0.25),
        bodyText1:
            TextStyle(fontFamily: 'Signi', fontSize: 16, letterSpacing: 0.5),
        button: TextStyle(fontFamily: 'Signi'),
        overline: TextStyle(fontFamily: 'Signi'),
      ));
      
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.grey[50],
    cardColor: Colors.white,
    buttonColor: Colors.yellow,
    shadowColor: Color(0xffeaeaea),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF212843),
    ),
     iconTheme: IconThemeData(
        color:  Color(0xff3d63ff),
      ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom( primary:Color(0xff212843))),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary:Colors.white,
      )
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    // backgroundColor: Colors.black,
    cardColor: Colors.black,
    buttonColor: Colors.red,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.amber[900]
    ),
    shadowColor: Color(0xff1a1a1a),
    iconTheme: IconThemeData(
        color: Colors.white,
      ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary:Colors.black
      )
    ),
  );
}


class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';
  /// Get isDarkMode info from local storage and return ThemeMode
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  /// Save isDarkMode to local storage
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  /// Switch theme and save to local storage
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

  
}
