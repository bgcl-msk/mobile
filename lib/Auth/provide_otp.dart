import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../dark theme/theme_model.dart';
import '../widgets/Text Field Widgets/textfields.dart';
import '../widgets/button widgets/primary_button.dart';
import 'change_password.dart';
import 'forget_password.dart';

class ProvideOTP extends StatefulWidget {
  const ProvideOTP({super.key});

  @override
  State<ProvideOTP> createState() => _ProvideOTPState();
}

//----------------------------------------------
// an email controller
//----------------------------------------------
final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();

class _ProvideOTPState extends State<ProvideOTP> {
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
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  const EdgeInsets.only(right: 10, top: 100),
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
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/msk_logo.png',
                              height: 76,
                              width: 76,
                            ),
                            const SizedBox(height: 7),
                            const Text(
                              'Provide OTP',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Montserrat-Regular',
                              ),
                            ),
                            MyTextField(
                              controller: _emailController,
                              hintext: 'Enter OTP',
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your OTP';
                                }

                                return null;
                              },
                            ),
                            PrimaryButton(
                              buttonName: 'VERIFY',
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  Get.to(const ForgotPassword(),
                                      duration: const Duration(seconds: 1),
                                      transition: Transition.native);
                                }
                              },
                            ),
                            const Text(
                              'Didn’t receive any code?',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Montserrat-Regular',
                              ),
                            ),
                          ],
                        ),
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
