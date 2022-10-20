// ignore_for_file: prefer_const_constructors

import 'package:app_doctor/shared/auth/constant.dart';
import 'package:app_doctor/shared/auth/routes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4)).then((value) {
      Navigator.pushReplacementNamed(context, AppRoutes.HomePage);
      // Navigator.pushReplacementNamed(context, AppRoutes.HomesPage);

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Constant.primaryColor),
        child: Center(
          child: Text(
            appName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.white),
          ),
        ),
      ),
    );
  }
}
