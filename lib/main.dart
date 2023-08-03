import 'package:flutter/material.dart';
import 'package:mobile/Screens/splash_screen.dart';

void main() {
  runApp(const MyStoreKeeper());
}

class MyStoreKeeper extends StatelessWidget {
  const MyStoreKeeper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
