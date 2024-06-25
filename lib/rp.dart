import 'package:flutter/material.dart';

class Request {
  final String productName;
  final String date;
  final int totalQuantity;
  final String status;

  Request({
    required this.productName,
    required this.date,
    required this.totalQuantity,
    required this.status,
  });
}

class RequestProvider with ChangeNotifier {
  List<Request> _requests = [];

  List<Request> get requests => _requests;

  void addRequest(Request request) {
    _requests.add(request);
    notifyListeners();
  }
}
