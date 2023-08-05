import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.push(
          context, MaterialPageRoute(
          builder: (context)=>const LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
          child: Container(
            height: size*0.4, width: size*0.4,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('images/mskgif.gif'),
                  fit: BoxFit.fill,
                  repeat: ImageRepeat.noRepeat,
                ),
              ),
          )),
    );
  }
}
