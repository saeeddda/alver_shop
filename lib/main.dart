import 'package:flutter/material.dart';

import 'package:alver_shop/constants/colors.dart';
import 'package:alver_shop/pages/alver_home.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: mainColor),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Alver Shop",
      theme: ThemeData(
        backgroundColor: bgColor,
        primaryColor: mainColor,
      ),
      home: const AlverHome(),
    );
  }
}
