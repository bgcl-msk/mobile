import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../dark theme/theme_model.dart';
import '../widgets/Text Field Widgets/textfields.dart';
import '../widgets/button widgets/primary_button.dart';
import 'provide_otp.dart';

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

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(
        builder: (context, ThemeModel themeNotifier, child) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //----------------------------------------------
                      // A button for the dark theme
                      //----------------------------------------------
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, top: 100),
                              child: IconButton(
                                onPressed: () {
                                  themeNotifier.isDark
                                      ? themeNotifier.isDark = false
                                      : themeNotifier.isDark = true;
                                },
                                icon: Icon(
                                  themeNotifier.isDark
                                      ? Icons.nightlight_round
                                      : Icons.wb_sunny,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      //----------------------------------------------
                      // Forgot password details
                      //----------------------------------------------
                      Column(
                        children: [
                          //----------------------------------------------
                          // Logo
                          //----------------------------------------------

                          Image.asset(
                            'assets/images/msk_logo.png',
                            height: 76,
                            width: 76,
                          ),
                          const SizedBox(height: 7),
                          const Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat-Regular',
                            ),
                          ),
                          //----------------------------------------------
                          // Email TextField
                          //----------------------------------------------

                          MyTextField(
                            controller: _emailController,
                            hintext: 'Email/Contact',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty || !value.contains('@')) {
                                return 'Please enter your email/contact';
                              }

                              return null;
                            },
                          ),
                          //----------------------------------------------
                          // Button
                          //----------------------------------------------

                          PrimaryButton(
                            buttonName: 'Submit',
                            onPress: () {
                              if (_formKey.currentState!.validate()) {
                                Get.to(const ProvideOTP(),
                                    duration: const Duration(seconds: 1),
                                    transition: Transition.native);
                              }
                            },
                          ),
                          const Text(
                            'Didn’t receive any code?',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Montserrat-Regular',
                            ),
                          ),
                          const Text(
                            'Request new code in 00:30s',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Montserrat-Regular',
                            ),
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
                              // Add your back button functionality here
                            },
                            child: const Icon(
                              Icons.arrow_back,
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
          );
        },
      ),
    );
  }
}
