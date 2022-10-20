// ignore_for_file: constant_identifier_names

import 'package:app_doctor/screen_pages/home_page.dart';
import 'package:app_doctor/shared/page/splash.dart';
import 'package:app_doctor/screen_pages/call_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String SplashPage = "Splash Page";
  static const String HomePage = "Home Page";
  static const String CallPage = "Call Page";
}

Map<String, WidgetBuilder> routes = {
  AppRoutes.SplashPage: (context) => const SplashPage(),
  AppRoutes.HomePage: (context) => const HomePage(),
  AppRoutes.CallPage: (context) => const CallPage(),
};
