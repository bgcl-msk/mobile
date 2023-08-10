import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../consts/text_styles.dart';
import '../../dark theme/theme_model.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final FocusNode _focusNode1 = FocusNode();
  final bool _isFocused1 = false;
  final FocusNode _focusNode2 = FocusNode();
  final bool _isFocused2 = false;
  late bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Consumer(
      builder: (context, ThemeModel themeNotifier, child){
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(size*0.1),
              child: Center(child: SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(//for logo
                    height: size*0.20,
                    child: Image.asset('assets/images/msklogo.png')
                  ),
                  SizedBox(height: size*0.1),
                  const Text( //for welcome text
                      'Welcome back',
                    style: TextStyle(
                        fontFamily: 'Montserrate',
                        fontSize: 24,
                        fontWeight: FontWeight.w500
                    )),
                  const SizedBox(height: 5),
                  const Text( //for signin text
                    'sign in to access your account',
                    style: TextStyle(
                      fontFamily: 'Montserrate',
                      fontSize: 14,
                    ),),
                  SizedBox(height: size*0.1),
                  ClipRRect( //email field
                    borderRadius: BorderRadius.circular(10.0),
                    child: TextField(
                      focusNode: _focusNode1,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: 'Enter your email',
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xff1D4771)),
                          ),
                          filled: true,
                          suffixIcon: Icon(
                            Icons.email_outlined,
                            color: _isFocused1 ? Colors.grey : Colors.grey,
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: size*0.05),
                  ClipRRect( //password field
                    borderRadius: BorderRadius.circular(10),
                    child: TextField(
                      focusNode: _focusNode2,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xff1D4771)),
                          ),
                          filled: true,
                          suffixIcon: Icon(
                            Icons.lock_outline,
                            color: _isFocused2 ? Colors.grey : Colors.grey,
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: size*0.025),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: isChecked,
                            activeColor: Color(0xff1D4771),
                            onChanged: (value){
                              setState(() {
                                isChecked = value!;
                              });
                            },),
                          const Text('Remember me')
                        ],
                      ),
                      TextButton( //forget password
                        child: const Text('Forget password ?',
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,

                          ),),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> const ForgotPassword()));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: size*0.1),
                  TextButton( //login button
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xff1D4771),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text('Login  >',
                          style: TextStyles().kbuttonStyle
                         ),
                      ),
                    ),
                    onPressed: () {  },
                  ),
                ],
              ),
            ))
            ),
          )
      );

      }
       
    );
  }
}
