import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilemsk/Screens/Auth/provide_otp_screen.dart';
import 'package:provider/provider.dart';

import '../../dark theme/theme_model.dart';
import '../../widgets/button widgets/primary_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

//----------------------------------------------
// an email controller
//----------------------------------------------
final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();

final FocusNode _focusNode1 = FocusNode();

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Consumer(
      builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(size * 0.1),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //----------------------------------------------
                        // Forgot password details
                        //----------------------------------------------
                        Column(
                          children: [
                            //----------------------------------------------
                            // Logo
                            //----------------------------------------------

                            SizedBox(
                                //for logo
                                height: size * 0.20,
                                child:
                                    Image.asset('assets/images/msklogo.png')),
                            SizedBox(height: size * 0.1),

                            const Text('Forgot Password',
                                style: TextStyle(
                                    fontFamily: 'Montserrate',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: size * 0.1),
                            //----------------------------------------------
                            // Email TextField
                            //----------------------------------------------
                            ClipRRect(
                              //email field
                              borderRadius: BorderRadius.circular(10.0),
                              child: TextField(
                                focusNode: _focusNode1,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'Email/Contact',
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xff1D4771)),
                                  ),
                                  filled: true,
                                ),
                              ),
                            ),
                            //----------------------------------------------
                            // Button
                            //----------------------------------------------
                            SizedBox(height: size * 0.05),
                            PrimaryButton(
                              buttonName: 'Submit',
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  Get.to(const ProvideOTPScreen(),
                                      duration: const Duration(seconds: 1),
                                      transition: Transition.native);
                                }
                              },
                            ),
                          ],
                        ),
                        //----------------------------------------------
                        // Back button
                        //----------------------------------------------
                        Align(
                          alignment: Alignment
                              .bottomLeft, // Align the FAB to the left side
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 100),
                            child: FloatingActionButton(
                              backgroundColor: const Color(0xFF1D4771),
                              onPressed: () {
                                Navigator.pop(context);
                                // Add your back button functionality here
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
