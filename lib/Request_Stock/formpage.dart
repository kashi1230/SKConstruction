import 'package:construction2/rp.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _quantity8mmController = TextEditingController();
  final TextEditingController _quantity10mmController = TextEditingController();
  final TextEditingController _quantity12mmController = TextEditingController();
  final TextEditingController _quantity16mmController = TextEditingController();
  final TextEditingController _quantity20mmController = TextEditingController();
  final TextEditingController _quantity25mmController = TextEditingController();

  int _totalQuantity = 0;

  void _calculateTotalQuantity() {
    setState(() {
      _totalQuantity = (int.tryParse(_quantity8mmController.text) ?? 0) +
          (int.tryParse(_quantity10mmController.text) ?? 0) +
          (int.tryParse(_quantity12mmController.text) ?? 0) +
          (int.tryParse(_quantity16mmController.text) ?? 0) +
          (int.tryParse(_quantity20mmController.text) ?? 0) +
          (int.tryParse(_quantity25mmController.text) ?? 0);
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final request = Request(
        productName: _productNameController.text,
        date: DateFormat.yMd().format(DateTime.now()),
        totalQuantity: _totalQuantity,
        status: 'Pending',
      );

      Provider.of<RequestProvider>(context, listen: false).addRequest(request);

      // Reset form
      _formKey.currentState!.reset();
      _calculateTotalQuantity();
    }
  }

  @override
  Widget build(BuildContext context) {
    final requests = Provider.of<RequestProvider>(context).requests;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: requests.isEmpty
            ? Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _productNameController,
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
                  hintText: DateFormat.yMd().format(DateTime.now()),
                ),
                enabled: false,
              ),
              TextFormField(
                controller: _quantity8mmController,
                decoration: InputDecoration(labelText: '8mm Quantity'),
                keyboardType: TextInputType.number,
                onChanged: (value) => _calculateTotalQuantity(),
              ),
              TextFormField(
                controller: _quantity10mmController,
                decoration: InputDecoration(labelText: '10mm Quantity'),
                keyboardType: TextInputType.number,
                onChanged: (value) => _calculateTotalQuantity(),
              ),
              TextFormField(
                controller: _quantity12mmController,
                decoration: InputDecoration(labelText: '12mm Quantity'),
                keyboardType: TextInputType.number,
                onChanged: (value) => _calculateTotalQuantity(),
              ),
              TextFormField(
                controller: _quantity16mmController,
                decoration: InputDecoration(labelText: '16mm Quantity'),
                keyboardType: TextInputType.number,
                onChanged: (value) => _calculateTotalQuantity(),
              ),
              TextFormField(
                controller: _quantity20mmController,
                decoration: InputDecoration(labelText: '20mm Quantity'),
                keyboardType: TextInputType.number,
                onChanged: (value) => _calculateTotalQuantity(),
              ),
              TextFormField(
                controller: _quantity25mmController,
                decoration: InputDecoration(labelText: '25mm Quantity'),
                keyboardType: TextInputType.number,
                onChanged: (value) => _calculateTotalQuantity(),
              ),
              SizedBox(height: 20),
              Text('Total Quantity: $_totalQuantity'),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _submitForm,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'Request',
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
        )
            : Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: requests.length,
                itemBuilder: (context, index) {
                  final request = requests[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.lightBlueAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.check_circle, color: Colors.white),
                      title: Text(
                        request.productName,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Date: ${request.date}\nStatus: ${request.status}\nTotal Quantity: ${request.totalQuantity}',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  _formKey.currentState!.reset();
                  _calculateTotalQuantity();
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    'Add More Requests',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
