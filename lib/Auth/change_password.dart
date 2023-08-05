import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../dark theme/theme_model.dart';
import '../widgets/Text Field Widgets/textfields.dart';
import '../widgets/button widgets/primary_button.dart';
import 'forget_password.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

//----------------------------------------------
// an email controller
//----------------------------------------------
final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _newPassword = TextEditingController();
final _confirmPassword = TextEditingController();
final _otpCode = TextEditingController();

class _ChangePasswordState extends State<ChangePassword> {
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
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.topRight,
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
                          Image.asset(
                            'assets/images/msk_logo.png',
                            height: 76,
                            width: 76,
                          ),
                          const SizedBox(height: 7),
                          const Text(
                            'Change Password',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat-Regular',
                            ),
                          ),
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
                          MyTextField(
                            controller: _newPassword,
                            hintext: 'New Password',
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a new password';
                              }
                              
                              return null;
                            },
                          ),
                          MyTextField(
                            controller: _confirmPassword,
                            hintext: 'Confirm Password',
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != _newPassword.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          MyTextField(
                            controller: _otpCode,
                            hintext: 'OTP code',
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the OTP code';
                              }
                              // Perform OTP validation here
                              return null;
                            },
                          ),
                          PrimaryButton(
                            buttonName: 'Submit',
                            onPress: () {
                              if (_formKey.currentState!.validate()) {
                                Get.to(const ForgotPassword(),
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
                          padding: const EdgeInsets.all(15.0),
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
