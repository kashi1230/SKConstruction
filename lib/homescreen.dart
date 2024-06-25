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
      appBar:  AppBar(
        title: TextBuilder(text: "Services",fontWeight: FontWeight.bold,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle,color: Colors.black,size: 30,),
            onPressed: () {
              // Handle profile icon press
              print('Profile icon pressed');
            },
          ),
          IconButton(
            icon: Icon(Icons.logout,color: Colors.redAccent,),
            onPressed: () {
              // Handle logout button press
              print('Logout button pressed');
              // Here you can add your logout logic, e.g., navigate to login screen
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Image.asset(
            'assets/icons/home.png', // Replace with your logo image path
            height: 200,
            width: 230,
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
