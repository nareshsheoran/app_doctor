// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors

import 'dart:io';
import 'package:app_doctor/shared/page/splash.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:app_doctor/shared/auth/constant.dart';
import 'package:app_doctor/shared/auth/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  if (foundation.kDebugMode) {
    debugPrint('release mode');
  } else {
    debugPrint('debug mode');
  }

  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            elevation: 0,
            color: Constant.primaryColor,
            iconTheme: IconThemeData(color: Constant.primaryColor)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Constant.primaryColor,
            selectedIconTheme: IconThemeData(color: Constant.primaryColor)),
        primaryColor: Constant.primaryColor,
        iconTheme: IconThemeData(color: Constant.primaryColor),
      ),
      home: SplashPage(),
      color: Constant.primaryColor,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
