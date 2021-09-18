import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themes {
  static int get lightMode => 1;

  static int get darkMode => 2;

  /// NAME         SIZE  WEIGHT  SPACING
  /// headline1    96.0  light   -1.5
  /// headline2    60.0  light   -0.5
  /// headline3    48.0  regular  0.0
  /// headline4    34.0  regular  0.25
  /// headline5    24.0  regular  0.0
  /// headline6    20.0  medium   0.15
  /// subtitle1    16.0  regular  0.15
  /// subtitle2    14.0  medium   0.1
  /// body1        16.0  regular  0.5   (bodyText1)
  /// body2        14.0  regular  0.25  (bodyText2)
  /// button       14.0  medium   1.25
  /// caption      12.0  regular  0.4
  /// overline     10.0  regular  1.5

  static final lightTextTheme = Typography.material2018(
          platform:
              Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android)
      .black
      .merge(TextTheme(
        headline1: TextStyle(fontFamily: 'Montserrat'),
        headline2: TextStyle(fontFamily: 'Montserrat'),
        headline3: TextStyle(fontFamily: 'Montserrat'),
        headline4: TextStyle(fontFamily: 'Montserrat'),
        headline5: TextStyle(fontFamily: 'Montserrat'),
        headline6: TextStyle(fontFamily: 'Montserrat'),
        subtitle1: TextStyle(fontFamily: 'Montserrat'),
        subtitle2: TextStyle(fontFamily: 'Montserrat'),
        caption: TextStyle(fontFamily: 'Montserrat'),
        bodyText2:
            TextStyle(fontFamily: 'Lato', fontSize: 14, letterSpacing: 0.25),
        bodyText1:
            TextStyle(fontFamily: 'Lato', fontSize: 16, letterSpacing: 0.5),
        button: TextStyle(fontFamily: 'Montserrat'),
        overline: TextStyle(fontFamily: 'Montserrat'),
      ));

  static final darkTextTheme = Typography.material2018(
          platform:
              Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android)
      .white
      .merge(TextTheme(
        headline1: TextStyle(fontFamily: 'Montserrat'),
        headline2: TextStyle(fontFamily: 'Montserrat'),
        headline3: TextStyle(fontFamily: 'Montserrat'),
        headline4: TextStyle(fontFamily: 'Montserrat'),
        headline5: TextStyle(fontFamily: 'Montserrat'),
        headline6: TextStyle(fontFamily: 'Montserrat'),
        subtitle1: TextStyle(fontFamily: 'Montserrat'),
        subtitle2: TextStyle(fontFamily: 'Montserrat'),
        caption: TextStyle(fontFamily: 'Montserrat'),
        bodyText2:
            TextStyle(fontFamily: 'Lato', fontSize: 14, letterSpacing: 0.25),
        bodyText1:
            TextStyle(fontFamily: 'Lato', fontSize: 16, letterSpacing: 0.5),
        button: TextStyle(fontFamily: 'Montserrat'),
        overline: TextStyle(fontFamily: 'Montserrat'),
      ));

  static ThemeData get lightTheme {
    return ThemeData(
      // canvasColor: Colors.lightBlue[50],
      brightness: Brightness.light,
      primaryColor: Color(0xff3d63ff),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      navigationRailTheme: NavigationRailThemeData(
          selectedIconTheme:
              IconThemeData(color: Color(0xff3d63ff), opacity: 1, size: 24),
          unselectedIconTheme:
              IconThemeData(color: Color(0xff495057), opacity: 1, size: 24),
          backgroundColor: Color(0xffffffff),
          elevation: 3,
          selectedLabelTextStyle: TextStyle(color: Color(0xff3d63ff)),
          unselectedLabelTextStyle: TextStyle(color: Color(0xff495057))),
      colorScheme: ColorScheme.light(
          primary: Color(0xff3d63ff),
          onPrimary: Colors.white,
          primaryVariant: Color(0xff0055ff),
          secondary: Color(0xff495057),
          secondaryVariant: Color(0xff3cd278),
          onSecondary: Colors.lightBlue[800]!,
          surface: Color(0xffe2e7f1),
          background: Color(0xfff3f4f7),
          onBackground: Color(0xff495057)),
      cardTheme: CardTheme(
        color: Colors.white,
        shadowColor: Colors.black.withOpacity(0.4),
        elevation: 1,
        margin: EdgeInsets.all(0),
      ),
      inputDecorationTheme:
          InputDecorationTheme(hintStyle: TextStyle(color: Color(0xaa495057))),
      splashColor: Colors.grey.shade300,
      iconTheme: IconThemeData(
        color: Color(0xff3d63ff),
      ),
      appBarTheme: AppBarTheme(
        actionsIconTheme: IconThemeData(
          color: Color(0xff495057),
        ),
        color: Color(0xffffffff),
        iconTheme: IconThemeData(color: Color(0xff495057), size: 24),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        animationDuration: Duration(milliseconds: 300),
        elevation: MaterialStateProperty.all<double>(15.0),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xff3f72af)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)))),
      )),
      primaryTextTheme: lightTextTheme,
      textTheme: lightTextTheme,
      fontFamily: 'Montserrat',
      indicatorColor: Colors.white,
      disabledColor: Colors.grey.shade500,
      highlightColor: Colors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xff3d63ff),
          splashColor: Colors.white.withAlpha(100),
          highlightElevation: 8,
          elevation: 4,
          focusColor: Color(0xff3d63ff),
          hoverColor: Color(0xff3d63ff),
          foregroundColor: Colors.white),
      dividerColor: Color(0xffd1d1d1),
      errorColor: Color(0xfff0323c),
      cardColor: Colors.white,
      accentColor: Color(0xff3d63ff),
      popupMenuTheme: PopupMenuThemeData(
        color: Color(0xffffffff),
        textStyle: lightTextTheme.bodyText2!
            .merge(TextStyle(color: Color(0xff495057))),
      ),
      bottomAppBarTheme:
          BottomAppBarTheme(color: Color(0xffffffff), elevation: 2),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Color(0xff495057),
        labelColor: Color(0xff3d63ff),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
        ),
      ),

      sliderTheme: SliderThemeData(
        activeTrackColor: Color(0xff3d63ff),
        inactiveTrackColor: Color(0xff3d63ff).withAlpha(140),
        trackShape: RoundedRectSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: Color(0xff3d63ff),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
        tickMarkShape: RoundSliderTickMarkShape(),
        inactiveTickMarkColor: Colors.red[100],
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        brightness: Brightness.dark,
        // canvasColor: Color(0xff3d63ff),
        primaryColor: Color(0xff3d63ff),
        scaffoldBackgroundColor: Color(0xff464c52),
        backgroundColor: Color(0xff464c52),
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: Color(0xffffffff),
          ),
          color: Color(0xff2e343b),
          iconTheme: IconThemeData(color: Color(0xffffffff), size: 24),
        ),
        colorScheme: ColorScheme.dark(
          primary: Color(0xff3d63ff),
          primaryVariant: Color(0xff3d63ff),
          secondary: Color(0xff00cc77),
          secondaryVariant: Color(0xff00cc77),
          background: Color(0xff343a40),
          onPrimary: Colors.white,
          onBackground: Colors.white,
          onSecondary: Colors.white,
          surface: Color(0xff585e63),
        ),
        cardTheme: CardTheme(
          color: Color(0xff37404a),
          shadowColor: Color(0xff000000),
          elevation: 1,
          margin: EdgeInsets.all(0),
        ),
        iconTheme: IconThemeData(
          color: Color(0xffffffff),
        ),
        primaryTextTheme: darkTextTheme,
        textTheme: darkTextTheme,
        fontFamily: 'Montserrat',
        indicatorColor: Colors.white,
        disabledColor: Color(0xffa3a3a3),
        highlightColor: Colors.grey.shade600,
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.all(12.0),
            hintStyle: TextStyle(color: Colors.white),
            errorBorder: UnderlineInputBorder()),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          animationDuration: Duration(milliseconds: 300),
          elevation: MaterialStateProperty.all<double>(15.0),
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xff3f72af)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)))),
        )),
        dividerColor: Color(0xffd1d1d1),
        errorColor: Colors.orange,
        cardColor: Color(0xff282a2b),
        splashColor: Colors.white.withAlpha(100),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xff3d63ff),
            splashColor: Colors.white.withAlpha(100),
            highlightElevation: 8,
            elevation: 4,
            focusColor: Color(0xff3d63ff),
            hoverColor: Color(0xff3d63ff),
            foregroundColor: Colors.white),
        accentColor: Color(0xff3d63ff),
        bottomAppBarTheme:
            BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Color(0xff495057),
          labelColor: Color(0xff3d63ff),
          indicatorSize: TabBarIndicatorSize.label,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
          ),
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: Color(0xff3d63ff),
          inactiveTrackColor: Color(0xff3d63ff).withAlpha(100),
          trackShape: RoundedRectSliderTrackShape(),
          trackHeight: 4.0,
          thumbColor: Color(0xff3d63ff),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
          tickMarkShape: RoundSliderTickMarkShape(),
          inactiveTickMarkColor: Colors.red[100],
          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          valueIndicatorTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        cupertinoOverrideTheme: CupertinoThemeData());
  }

  static ThemeData fromThemeMode(int themeMode) {
    switch (themeMode) {
      case 1:
        return lightTheme;
      case 2:
        return darkTheme;
      default:
        return lightTheme;
    }
  }

  static getDetailsAppBarColorFromThemeMode(int themeMode) {
    switch (themeMode) {
      case 1:
        return const Color(0xff3f72af);
      case 2:
        return const Color(0xff2e343b);
    }
  }

  static CustomAppTheme getCustomAppTheme(int themeMode) {
    if (themeMode == lightMode) {
      return CustomAppTheme.lightCustomAppTheme;
    } else if (themeMode == darkMode) {
      return CustomAppTheme.darkCustomAppTheme;
    }
    return CustomAppTheme.darkCustomAppTheme;
  }

  static NavigationBarTheme getNavigationThemeFromMode(int themeMode) {
    NavigationBarTheme navigationBarTheme = NavigationBarTheme();
    if (themeMode == lightMode) {
      navigationBarTheme.backgroundColor = Colors.grey[100];
      navigationBarTheme.selectedItemColor = Color(0xff3d63ff);
      navigationBarTheme.unselectedItemColor = Color(0xff495057);
      navigationBarTheme.selectedOverlayColor = Color(0x383d63ff);
    } else if (themeMode == darkMode) {
      navigationBarTheme.backgroundColor = Color(0xff37404a);
      navigationBarTheme.selectedItemColor = Colors.white;
      navigationBarTheme.unselectedItemColor = Color(0xffd1d1d1);
      navigationBarTheme.selectedOverlayColor = Color(0xffffffff);
    }
    return navigationBarTheme;
  }
}

class CustomAppTheme {
  final Color bgLayer1,
      bgLayer2,
      bgLayer3,
      bgLayer4,
      disabledColor,
      onDisabled,
      colorInfo,
      colorWarning,
      colorSuccess,
      colorError,
      shadowColor,
      onInfo,
      onWarning,
      onSuccess,
      onError;

  final Color groceryPrimaryColor,
      onGroceryPrimaryColor,
      groceryBg1,
      groceryBg2;

  final Color lightBlack, red, green, yellow, orange, blue, purple, pink, brown;

  CustomAppTheme({
    this.bgLayer1 = const Color(0xffffffff),
    this.bgLayer2 = const Color(0xfff8faff),
    this.bgLayer3 = const Color(0xfff8f8f8),
    this.bgLayer4 = const Color(0xffdcdee3),
    this.disabledColor = const Color(0xffdcc7ff),
    this.onDisabled = const Color(0xffffffff),
    this.colorWarning = const Color(0xffffc837),
    this.colorInfo = const Color(0xffff784b),
    this.colorSuccess = const Color(0xff3cd278),
    this.shadowColor = const Color(0xff1f1f1f),
    this.onInfo = const Color(0xffffffff),
    this.onWarning = const Color(0xffffffff),
    this.onSuccess = const Color(0xffffffff),
    this.colorError = const Color(0xfff0323c),
    this.onError = const Color(0xffffffff),

    //Grocery color scheme
    this.groceryPrimaryColor = const Color(0xff10bb6b),
    this.onGroceryPrimaryColor = const Color(0xffffffff),
    this.groceryBg1 = const Color(0xfffbfbfb),
    this.groceryBg2 = const Color(0xfff5f5f5),

    //Color
    this.lightBlack = const Color(0xffa7a7a7),
    this.red = const Color(0xffFF0000),
    this.green = const Color(0xff008000),
    this.yellow = const Color(0xfffff44f),
    this.orange = const Color(0xffFFA500),
    this.blue = const Color(0xff0000ff),
    this.purple = const Color(0xff800080),
    this.pink = const Color(0xffFFC0CB),
    this.brown = const Color(0xffA52A2A),
  });

  //--------------------------------------  Custom App Theme ----------------------------------------//

  static final CustomAppTheme lightCustomAppTheme = CustomAppTheme(
    bgLayer1: Color(0xffffffff),
    bgLayer2: Color(0xfff9f9f9),
    bgLayer3: Color(0xffe8ecf4),
    bgLayer4: Color(0xffdcdee3),
    disabledColor: Color(0xff636363),
    onDisabled: Color(0xffffffff),
    colorInfo: Color(0xffff784b),
    colorWarning: Color(0xffffc837),
    colorSuccess: Color(0xff3cd278),
    shadowColor: Color(0xffeaeaea),
    onInfo: Color(0xffffffff),
    onSuccess: Color(0xffffffff),
    onWarning: Color(0xffffffff),
    colorError: Color(0xfff0323c),
    onError: Color(0xffffffff),
  );

  static final CustomAppTheme darkCustomAppTheme = CustomAppTheme(
      bgLayer1: Color(0xff212429),
      bgLayer2: Color(0xff282930),
      bgLayer3: Color(0xff303138),
      bgLayer4: Color(0xff383942),
      disabledColor: Color(0xffbababa),
      onDisabled: Color(0xff000000),
      colorInfo: Color(0xffff784b),
      colorWarning: Color(0xffffc837),
      colorSuccess: Color(0xff3cd278),
      shadowColor: Color(0xff1a1a1a),
      onInfo: Color(0xffffffff),
      onSuccess: Color(0xffffffff),
      onWarning: Color(0xffffffff),
      colorError: Color(0xfff0323c),
      onError: Color(0xffffffff),

      //Grocery Dark
      groceryBg1: Color(0xff212429),
      groceryBg2: Color(0xff282930));
}

class NavigationBarTheme {
  Color? backgroundColor,
      selectedItemIconColor,
      selectedItemTextColor,
      selectedItemColor,
      selectedOverlayColor,
      unselectedItemIconColor,
      unselectedItemTextColor,
      unselectedItemColor;
}
