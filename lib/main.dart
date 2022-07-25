import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:softus/core/apptheame.dart';
import 'package:softus/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'School',
        debugShowCheckedModeBanner: false,
        theme: appTheame,
        scrollBehavior: ScrollBehavior().copyWith(
          dragDevices: {
            // PointerDeviceKind.trackpad,
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        home: Home());
  }
}
