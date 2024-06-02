import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/model/UserClass.dart';
import 'package:ecommerce/model/userProvider.dart';
import 'package:ecommerce/services/userOperations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _phonenoController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  UserClass user = UserClass(username: '', password: '');
  UserOperations operate = UserOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Enter your Details",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 70.0,
                      ),
                      child: TextFormField(
                        controller: _fullnameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 9, right: 9),
                            child: Icon(Icons.account_circle_outlined),
                          ),
                          labelText: 'Full Name',
                          fillColor: Colors.grey[100],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.0),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 180, 104, 216),
                                width: 0.5),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 70.0,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType
                            .number, // This sets the keyboard type to a number pad
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // This allows only digits (numbers)
                        controller: _phonenoController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field is required";
                          } else if (value.length != 10) {
                            return "Phone number should be exactly 10 characters";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 9, right: 9),
                            child: Icon(Icons.phone),
                          ),
                          labelText: 'Phone Number',
                          fillColor: Colors.grey[100],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.0),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 180, 104, 216),
                                width: 0.5),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 70.0,
                      ),
                      child: TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 9, right: 9),
                            child: Icon(Icons.person_2),
                          ),
                          labelText: 'Username',
                          fillColor: Colors.grey[100],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.0),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 180, 104, 216),
                                width: 0.5),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 70.0,
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 9, right: 9),
                            child: Icon(Icons.lock_outline),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(left: 14, right: 14),
                            child: IconButton(
                              icon: Icon(_obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                          labelText: 'Password',
                          fillColor: Colors.grey[100],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Center(
                      child: Consumer<userProvider>(
                        builder: (context, provider, child) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 206, 46, 46),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              minimumSize: Size(180, 50),
                            ),
                            onPressed: () async {
                              final form = _formKey.currentState;
                              if (form!.validate()) {
                                print("Valid Form");
                                user.username = _usernameController.text.trim();
                                user.password = _passwordController.text.trim();
                                user.phone =
                                    int.parse(_phonenoController.text.trim());
                                user.name = _fullnameController.text.trim();
                                provider.setValue(user.username, user.name!);
                                int a = await operate.add(user);
                                int b = await operate.create(user);
                                if (a == 1 && b == 1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text("Account couldn't be created"),
                                    duration: Duration(milliseconds: 1500),
                                  ));
                                }
                              } else {
                                print("error in form");
                              }
                            },
                            child: Text(
                              'SignUp',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
