
import 'package:construction2/Alocate_stock/allocate-stockForm.dart';
import 'package:construction2/widgets/textBuilder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllocateStockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextBuilder(text: "My Stock",fontWeight: FontWeight.bold,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StockDetailsBox(), // Widget to display total stock details
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Get.to(AllocateStockForm());
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blueAccent, // Use your custom color
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    'Allocate ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StockDetailsBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Stock Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          // Example content, replace with actual stock details
          Text('Product:  Steel'),
          Text('Total Quantity: 1000'),
          Text('Last Updated: 2024-06-24'),
        ],
      ),
    );
  }
}
