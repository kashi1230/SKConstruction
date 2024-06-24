// import 'dart:convert';
//
// import 'package:construction2/Auth_Screens/Login_Screen.dart';
// import 'package:construction2/widgets/customTextFeild.dart';
// import 'package:construction2/widgets/textBuilder.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class RegistrationScreen extends StatefulWidget {
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   bool _isRegistering = false;
//
//   // Future<void> _registerUser() async {
//   //   setState(() {
//   //     _isRegistering = true;
//   //   });
//   //
//   //   String url = 'http://192.168.1.7/TravelEver/registration.php';
//   //   var body = {
//   //     'name': _nameController.text.trim(),
//   //     'email': _emailController.text.trim(),
//   //     'password': _passwordController.text.trim(),
//   //   };
//   //
//   //   try {
//   //     var response = await http.post(Uri.parse(url), body: jsonEncode(body));
//   //     if (response.statusCode == 200) {
//   //       var data = jsonDecode(response.body);
//   //       if (data['success'] == 'success') {
//   //         ScaffoldMessenger.of(context).showSnackBar(
//   //           SnackBar(
//   //             content: Text('Registration successful'),
//   //             duration: Duration(seconds: 2),
//   //           ),
//   //         );
//   //       } else {
//   //         // Registration failed
//   //         ScaffoldMessenger.of(context).showSnackBar(
//   //           SnackBar(
//   //             content: Text(data['message'] ?? 'Registration failed'),
//   //             duration: Duration(seconds: 2),
//   //           ),
//   //         );
//   //       }
//   //     } else {
//   //       // Handle other HTTP status codes
//   //       print('HTTP Error ${response.statusCode}: ${response.reasonPhrase}');
//   //     }
//   //   } catch (e) {
//   //     // Handle network errors
//   //     print('Network Error: $e');
//   //   } finally {
//   //     setState(() {
//   //       _isRegistering = false;
//   //     });
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: Colors.transparent,
//             expandedHeight: 180.0,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Image.asset(
//                 'assets/icons/logo.png',
//                 height: 180,
//                 width: 210,
//               ),
//             ),
//             floating: true,
//             pinned: true,
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 32.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(height: 30),
//
//                     CustomTextField(
//                       labelText: "Name",
//                       prefixIcon: Icons.person,
//                       controller: _nameController,
//                       focusNode: FocusNode(),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your name';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 16),
//
//                     CustomTextField(
//                       labelText: 'Email',
//                       prefixIcon: Icons.email,
//                       controller: _emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         // Basic email validation
//                         if (!isValidEmail(value)) {
//                           return 'Please enter a valid email address';
//                         }
//                         return null;
//                       },
//                       focusNode: FocusNode(),
//                     ),   SizedBox(height: 16),
//                     CustomTextField(
//                       labelText: 'City',
//                       prefixIcon: Icons.location_city,
//                       controller: _passwordController,
//                       obscureText: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your city';
//                         }
//                         // Add additional password validation if needed
//                         return null;
//                       },
//                       focusNode: FocusNode(),
//                     ),   SizedBox(height: 16),
//                     CustomTextField(
//                       labelText: 'State',
//                       prefixIcon: Icons.location_city,
//                       controller: _passwordController,
//                       obscureText: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your state';
//                         }
//                         // Add additional password validation if needed
//                         return null;
//                       },
//                       focusNode: FocusNode(),
//                     ),   SizedBox(height: 16),
//                     CustomTextField(
//                       labelText: 'Site Address',
//                       prefixIcon: Icons.lock,
//                       controller: _passwordController,
//                       obscureText: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your Site address';
//                         }
//                         // Add additional password validation if needed
//                         return null;
//                       },
//                       focusNode: FocusNode(),
//                     ),   SizedBox(height: 16),
//                   CustomTextField(
//                   labelText: 'Password',
//                   prefixIcon: Icons.lock,
//               controller: _passwordController,
//               obscureText: true,
//                   validator: (value) {
//             if (value == null || value.isEmpty) {
//             return 'Please enter your password';
//             }
//             // Add additional password validation if needed
//             return null;
//             },
//               focusNode: FocusNode(),
//             ),
//                     SizedBox(height: 16),
//
//                     CustomTextField(
//                       labelText: 'Password',
//                       prefixIcon: Icons.lock,
//                       controller: _passwordController,
//                       obscureText: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your password';
//                         }
//                         // Add additional password validation if needed
//                         return null;
//                       },
//                       focusNode: FocusNode(),
//                     ),
//                     SizedBox(height: 30),
//
//                     GestureDetector(
//                       onTap: () {
//                         if (_formKey.currentState!.validate()) {
//                           Get.offAll(LoginScreen());
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text("user Registerd Succesfull")),
//                           );
//                           _nameController.clear();
//                           _passwordController.clear();
//                           _emailController.clear();
//                         }
//                       },
//                       child: AnimatedContainer(
//                         duration: Duration(milliseconds: 300),
//                         width: 200,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           color: Colors.blueAccent,
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         child: Center(
//                           child: Text(
//                             'Register',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     SizedBox(height: 12),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Expanded(
//                           child: Divider(
//                             color: Colors.grey,
//                             thickness: 1,
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 16),
//                           child: Text(
//                             'OR',
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Divider(
//                             color: Colors.grey,
//                             thickness: 1,
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     SizedBox(height: 16),
//
//                     // OutlinedButton.icon(
//                     //   onPressed: () {
//                     //     // Handle Google Sign-In
//                     //   },
//                     //   style: OutlinedButton.styleFrom(
//                     //     padding: EdgeInsets.symmetric(vertical: 12),
//                     //     shape: RoundedRectangleBorder(
//                     //       borderRadius: BorderRadius.circular(25),
//                     //     ),
//                     //     side: BorderSide(color: Colors.red),
//                     //   ),
//                     //   icon: Image.asset(
//                     //     'assets/images/google.png',
//                     //     height: 26,
//                     //   ),
//                     //   label: Text(
//                     //     'Sign in with Google',
//                     //     style: TextStyle(
//                     //       fontSize: 14,
//                     //       color: Colors.black,
//                     //     ),
//                     //   ),
//                     // ),
//
//                     SizedBox(height: 24),
//
//                     GestureDetector(
//                       onTap: () {
//                       },
//                       child: AnimatedDefaultTextStyle(
//                         duration: Duration(milliseconds: 200),
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 16,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             TextBuilder(text: "Alrady have an Account",latterSpacing: 1,color: Colors.black,fontWeight: FontWeight.bold,),
//                             InkWell(
//                                 onTap: (){
//                                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
//                                 },
//                                 child: TextBuilder(text: " ?Login",latterSpacing: 1,color: Colors.blueAccent,fontWeight: FontWeight.bold,)),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     SizedBox(height: 24),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Basic email validation
//   bool isValidEmail(String email) {
//     String emailRegex =
//         r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
//     return RegExp(emailRegex).hasMatch(email);
//   }
// }
