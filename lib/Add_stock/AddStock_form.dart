import 'package:construction2/Add_stock/AddStock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddStockScreen extends StatefulWidget {
  @override
  _AddStockScreenState createState() => _AddStockScreenState();
}

class _AddStockScreenState extends State<AddStockScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();

  String _selectedSize = '';
  Map<String, List<TextEditingController>> _quantityControllers = {}; // Map to hold quantity controllers

  void _updateTotalPrice() {
    double totalPrice = 0.0;
    _quantityControllers.forEach((size, controllers) {
      controllers.forEach((controller) {
        int quantity = int.tryParse(controller.text) ?? 0;
        totalPrice += quantity.toDouble();
      });
    });
    double price = double.tryParse(_priceController.text) ?? 0.0;
    double gst = double.tryParse(_gstController.text) ?? 0.0;

    totalPrice = totalPrice * price + gst;
    _totalPriceController.text = totalPrice.toStringAsFixed(2);
  }

  void _onSizeSelected(String? size) {
    setState(() {
      _selectedSize = size ?? '';
      if (_selectedSize.isNotEmpty) {
        // Initialize controllers for the selected size if not already initialized
        if (!_quantityControllers.containsKey(_selectedSize)) {
          _quantityControllers[_selectedSize] = [
            TextEditingController()
          ]; // Start with one controller
        }
      }
    });
  }

  void _addQuantityField(String size) {
    setState(() {
      if (_quantityControllers.containsKey(size)) {
        _quantityControllers[size]!.add(TextEditingController());
      } else {
        _quantityControllers[size] = [TextEditingController()];
      }
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Save the stock details or perform any desired action
      final String productName = _productNameController.text;
      final String currentDate = DateFormat.yMd().format(DateTime.now());
      final double price = double.tryParse(_priceController.text) ?? 0.0;
      final double gst = double.tryParse(_gstController.text) ?? 0.0;
      final double totalPrice = double.tryParse(_totalPriceController.text) ?? 0.0;

      Map<String, List<int>> quantities = {};
      _quantityControllers.forEach((size, controllers) {
        quantities[size] = controllers.map((controller) => int.tryParse(controller.text) ?? 0).toList();
      });

      // Here you can handle the stock data (e.g., save to a database or state management solution)
      print('Product Name: $productName');
      print('Current Date: $currentDate');
      print('Quantities: $quantities');
      print('Price: $price');
      print('GST: $gst');
      print('Total Price: $totalPrice');

      // Clear the form after submission
      _formKey.currentState!.reset();
      _selectedSize = '';
      _quantityControllers.clear();
      _totalPriceController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat.yMd().format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Stock'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                // controller: _productNameController,
                decoration: InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Date',
                  hintText: currentDate,
                ),
                enabled: false,
              ),
              DropdownButtonFormField<String>(
                value: _selectedSize.isEmpty ? null : _selectedSize,
                decoration: InputDecoration(labelText: 'Size'),
                items: ['8mm', '10mm', '12mm', '16mm', '20mm', '25mm']
                    .map((size) => DropdownMenuItem(
                  value: size,
                  child: Text(size),
                ))
                    .toList(),
                onChanged: _onSizeSelected,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a size';
                  }
                  return null;
                },
              ),
              if (_selectedSize.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ..._quantityControllers[_selectedSize]!.mapIndexed((index, controller) {
                      return TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                          labelText: 'Quantity ${index + 1} for $_selectedSize',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) => _updateTotalPrice(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the quantity';
                          }
                          return null;
                        },
                      );
                    }).toList(),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => _addQuantityField(_selectedSize),
                      child: Text('Add Another Quantity for $_selectedSize'),
                    ),
                  ],
                ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                onChanged: (value) => _updateTotalPrice(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _gstController,
                decoration: InputDecoration(labelText: 'GST'),
                keyboardType: TextInputType.number,
                onChanged: (value) => _updateTotalPrice(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the GST amount';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _totalPriceController,
                decoration: InputDecoration(labelText: 'Total Price'),
                enabled: false,
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Stock Added Succefully!!'),
                      duration: Duration(seconds: 2),
                    ),

                  );
                  Get.back(result: () => AddStock());
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue, // Use your custom color
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'Add To Stock',
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
      ),
    );
  }
}

// Extension method to iterate over list with index
extension IterableExtension<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(int index, E e) f) sync* {
    var index = 0;
    for (final element in this) {
      yield f(index++, element);
    }
  }
}
