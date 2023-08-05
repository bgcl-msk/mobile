import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../dark theme/theme_model.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPress;

  const PrimaryButton({super.key, required this.buttonName, required this.onPress});

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Consumer(
      builder: (context, ThemeModel themeNotifier, child) {
        return GestureDetector(
          onTap: onPress,
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: deviceSize.width * 0.03,
                vertical: deviceSize.height * 0.03),
            padding: EdgeInsets.symmetric(
                horizontal: deviceSize.width * 0.01,
                vertical: deviceSize.height * 0.01),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xFF1D4771),
                borderRadius: BorderRadius.circular(10.0)),
            child:
            Center(child: Text(buttonName, style: textStyle(themeNotifier))),
          ),
        );
      },
    );
  }

  TextStyle textStyle(ThemeModel themeNotifier) {
    return const TextStyle(
      fontSize: 24,
      fontFamily: 'Montserrat-Regular',
      color:  Colors.white,
    );
  }
}