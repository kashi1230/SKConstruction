import 'package:construction2/Request_Stock/formpage.dart';
import 'package:construction2/main.dart';
import 'package:construction2/widgets/textBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RequestScreen extends StatefulWidget {
  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  double _progress = 0.5; // Initial progress
  bool _showAllIcons = false; // Flag to track whether to show all icons or not
  int touchedIndex = 0;

  void _toggleShowAllIcons() {
    setState(() {
      _showAllIcons = !_showAllIcons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextBuilder(text: "Request For Stock",fontWeight: FontWeight.bold,textAlign: TextAlign.center,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Image.asset(
            'assets/icons/req.png', // Replace with your logo image path
            height: 180,
            width: 210,
          ),
          SizedBox(height: 25,),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: _toggleShowAllIcons,
                  child: Text(
                    _showAllIcons ? 'See Less' : 'See More',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(_showAllIcons ? 20 : 6, (index) {
                return ConstructionIcon(
                  icon: _getIcon(index),
                  label: _getLabel(index),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  String _getLabel(int index) {
    List<String> labels = [
      'Steel',
      'Bricks',
      'Metals',
      'Concrete',
      'Tiles',
      'Painting',
      'Carpentry',
      'Electrical',
      'Plumbing',
      'Windows',
      'Doors',
      'Roofing',
      'Flooring',
      'Insulation',
      'HVAC',
      'Landscaping',
      'Excavation',
      'Demolition',
      'Surveying',
      'Safety'
    ];
    return labels[index];
  }

  String _getIcon(int index) {
    List<String> icons = [
      'assets/icons/metal.svg',
      'assets/icons/bricks.svg',
      'assets/icons/cement.svg',
      'assets/icons/jcb.svg',
      'assets/icons/labours.svg',
      'assets/icons/money.svg',
      'assets/icons/PL.svg',
      'assets/icons/construction.svg',
      'assets/icons/vendors.svg',
      'assets/icons/electriccity.svg',
      'assets/icons/metal.svg',
      'assets/icons/metal.svg',
      'assets/icons/metal.svg',
      'assets/icons/metal.svg',
      'assets/icons/metal.svg',
      'assets/icons/metal.svg',
      'assets/icons/metal.svg',
      'assets/icons/metal.svg',
      'assets/icons/metal.svg',
      'assets/icons/metal.svg'
    ];
    return icons[index];
  }
}

class ConstructionIcon extends StatefulWidget {
  final String icon;
  final String label;

  ConstructionIcon({required this.icon, required this.label});

  @override
  _ConstructionIconState createState() => _ConstructionIconState();
}

class _ConstructionIconState extends State<ConstructionIcon> {
  bool _showForm = true;
  List<Map<String, dynamic>> _requirements = [];

  void _addRequirement(String productName, int totalQuantity) {
    setState(() {
      _requirements.add({
        'productName': productName,
        'date': DateFormat.yMd().format(DateTime.now()),
        'totalQuantity': totalQuantity,
        'status': 'Pending',
      });
      _showForm = false;
    });
  }

  void _toggleForm() {
    setState(() {
      _showForm = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(FormScreen());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            widget.icon,
            height: 50,
            width: 50,
            color: Colors.blue,
          ),
          SizedBox(height: 8),
          Text(
            widget.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

