import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'formpage.dart';

class RequirementsListScreen extends StatelessWidget {
  final String productName;
  final String date;
  final int totalQuantity;

  RequirementsListScreen({
    required this.productName,
    required this.date,
    required this.totalQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requirements List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Product Name: $productName'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: $date'),
                        Text('Total Quantity: $totalQuantity'),
                        Text('Eng. name:  XYZ'),
                        Text('Site Id: N012'),
                        Text('Status: Pending'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormScreen(),
                  ),
                );
              },
              child: Text('Add More Requirements'),
            ),
          ],
        ),
      ),
    );
  }
}
