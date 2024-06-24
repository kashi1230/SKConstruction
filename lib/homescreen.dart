import 'package:construction2/Add_stock/AddStock.dart';
import 'package:construction2/Alocate_stock/Alocat_stock.dart';
import 'package:construction2/Request_Stock/formpage.dart';
import 'package:construction2/Request_Stock/request_screen.dart';
import 'package:construction2/main.dart';
import 'package:construction2/widgets/textBuilder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: TextBuilder(text: "Service Section",fontWeight: FontWeight.bold,),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Image.asset(
            'assets/icons/home.png', // Replace with your logo image path
            height: 180,
            width: 210,
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                 child: GestureDetector(
                   onTap: () {
                     Get.to(()=>RequestScreen());
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
                         'Request Stock',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 18,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                     ),
                   ),
                 ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(()=>AddStock());
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
                          'Add Stock',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                Get.to(()=>AlocateStock());
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
                    'Allocate Stock',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
