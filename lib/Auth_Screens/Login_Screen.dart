
import 'package:construction2/homescreen.dart';
import 'package:construction2/main.dart';
import 'package:construction2/widgets/customTextFeild.dart';
import 'package:construction2/widgets/textBuilder.dart';
import 'package:flutter/material.dart';// Replace with your custom text field widget
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoggingIn = false;

  // Future<void> _loginUser() async {
  //   setState(() {
  //     _isLoggingIn = true;
  //   });
  //
  //   String url = 'http://192.168.1.7/TravelEver/login.php';
  //   var body = {
  //     'email': _emailController.text.trim(),
  //     'password': _passwordController.text.trim(),
  //   };
  //
  //   try {
  //     var response = await http.post(Uri.parse(url), body: jsonEncode(body));
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);
  //       if (data['status']) {
  //         // Login successful
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text('Login successful'),
  //             duration: Duration(seconds: 2),
  //           ),
  //         );
  //         // Navigate to home screen or next screen after successful login
  //       } else {
  //         // Login failed
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text(data['message'] ?? 'Login failed'),
  //             duration: Duration(seconds: 2),
  //           ),
  //         );
  //       }
  //     } else {
  //       // Handle other HTTP status codes
  //       print('HTTP Error ${response.statusCode}: ${response.reasonPhrase}');
  //     }
  //   } catch (e) {
  //     // Handle network errors
  //     print('Network Error: $e');
  //   } finally {
  //     setState(() {
  //       _isLoggingIn = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 220.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/icons/logo.jpg', // Replace with your logo image path
                height: 180,
                width: 210,
              ),
            ),
            floating: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 30),
                    CustomTextField(
                      labelText: 'Email',
                      prefixIcon: Icons.email,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        // Basic email validation
                        if (!isValidEmail(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      focusNode: FocusNode(),
                    ),
                    SizedBox(height: 16),

                    CustomTextField(
                      labelText: 'Password',
                      prefixIcon: Icons.lock,
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        // Add additional password validation if needed
                        return null;
                      },
                      focusNode: FocusNode(),
                    ),
                    SizedBox(height: 30),

                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Login successful'),
                              duration: Duration(seconds: 2),
                            ),

                          );
                          _emailController.clear();
                          _passwordController.clear();
                          Get.offAll(()=>HomeScreen());
                        }
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
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Expanded(
                    //       child: Divider(
                    //         color: Colors.grey,
                    //         thickness: 1,
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 16),
                    //       child: Text(
                    //         'OR',
                    //         style: TextStyle(
                    //           color: Colors.grey,
                    //           fontSize: 16,
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Divider(
                    //         color: Colors.grey,
                    //         thickness: 1,
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    SizedBox(height: 16),

                    // OutlinedButton.icon(
                    //   onPressed: () {
                    //     // Handle Google Sign-In
                    //   },
                    //   style: OutlinedButton.styleFrom(
                    //     padding: EdgeInsets.symmetric(vertical: 12),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(25),
                    //     ),
                    //     side: BorderSide(color: Colors.red),
                    //   ),
                    //   icon: Image.asset(
                    //     'assets/images/google.png',
                    //     height: 26,
                    //   ),
                    //   label: Text(
                    //     'Sign in with Google',
                    //     style: TextStyle(
                    //       fontSize: 14,
                    //       color: Colors.black,
                    //     ),
                    //   ),
                    // ),

                    SizedBox(height: 24),

                    // GestureDetector(
                    //   onTap: () {
                    //     print('Navigate to registration screen');
                    //   },
                    //   child: AnimatedDefaultTextStyle(
                    //     duration: Duration(milliseconds: 200),
                    //     style: TextStyle(
                    //       color: Colors.blue,
                    //       fontSize: 16,
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         TextBuilder(text: "Don't have an Account",latterSpacing: 1,color: Colors.black,fontWeight: FontWeight.bold,),
                    //         TextBuilder(text: "? Register",latterSpacing: 1,color: Colors.blueAccent,fontWeight: FontWeight.bold,),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Basic email validation
  bool isValidEmail(String email) {
    String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    return RegExp(emailRegex).hasMatch(email);
  }
}
