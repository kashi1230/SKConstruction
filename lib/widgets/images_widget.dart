

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/scaffold.dart';

Widget bgWidget({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/1.jpg"), fit: BoxFit.fill)),
    child: child,
  );
}
