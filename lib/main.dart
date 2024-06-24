
import 'package:construction2/Auth_Screens/Login_Screen.dart';
import 'package:construction2/Auth_Screens/registration.dart';
import 'package:construction2/Request_Stock/formpage.dart';
import 'package:construction2/widgets/textBuilder.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'Request_Stock/requirmeentpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Relaxation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:LoginScreen(),
    );
  }
}

