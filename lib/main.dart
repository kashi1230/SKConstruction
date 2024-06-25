
import 'package:construction2/Auth_Screens/Login_Screen.dart';
import 'package:construction2/Auth_Screens/registration.dart';
import 'package:construction2/Request_Stock/formpage.dart';
import 'package:construction2/widgets/textBuilder.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'Request_Stock/requirmeentpage.dart';
import 'rp.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RequestProvider()),
      ],
      child: MyApp(),
    ),
  );
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
class ValueProvider extends ChangeNotifier {
  List<int> _value = [];
  String _salePermission = "";
  String _purchasePermission = "";

  List<int> get value => _value;

  void setValue(List<int> newValue) {
    _value = newValue;
    notifyListeners();
  }

  String get salePermission => _salePermission;
  String get purchasePermission => _purchasePermission;

  void setPermissions(String salePerm, String purchasePerm) {
    _salePermission = salePerm;
    _purchasePermission = purchasePerm;
    notifyListeners();
  }
}

