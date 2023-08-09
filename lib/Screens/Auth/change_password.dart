import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../dark theme/theme_model.dart';
import '../../widgets/Text Field Widgets/textfields.dart';
import '../../widgets/button widgets/primary_button.dart';
import 'forget_password_screen.dart';

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
    double size = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Consumer(
        builder: (context, ThemeModel themeNotifier, child) {
          return Scaffold(
            //----------------------------------------------
            // Back button
            //----------------------------------------------

            floatingActionButton: Padding(
              padding: EdgeInsets.only(left: size * 0.06, bottom: size * 0.05),
              child: FloatingActionButton(
                backgroundColor: const Color(0xff1D4771),
                child: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
            body: Padding(
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
                            SizedBox(
                                //for logo
                                height: size * 0.20,
                                child:
                                    Image.asset('assets/images/msklogo.png')),
                            SizedBox(height: size * 0.1),
                            const Text('Change Password',
                                style: TextStyle(
                                    fontFamily: 'Montserrate',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: size * 0.1),
                            MyTextField(
                              controller: _emailController,
                              hintext: 'Email/Contact',
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email/contact';
                                }

                                return null;
                              },
                            ),
                            SizedBox(height: size * 0.05),
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
                            SizedBox(height: size * 0.05),
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
                            SizedBox(height: size * 0.05),
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
                            SizedBox(height: size * 0.05),
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
                      ],
                    ),
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
