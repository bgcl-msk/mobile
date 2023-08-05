import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../dark theme/theme_model.dart';

class MyTextField extends StatelessWidget {
  final String hintext;
  
  final TextEditingController controller;
  
  final String? Function(dynamic value)? validator;
  final TextInputType keyboardType;

  const MyTextField({
    Key? key,
    //required this.iconData,
    required this.controller,
    //required this.height,
    required this.keyboardType,
    required this.hintext,
     this.validator, 
     //required String? Function(dynamic value) validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Consumer(
      builder: (context, ThemeModel themeNotifier, child) {
        return Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.symmetric(
              horizontal: deviceSize.width * 0.03,
              vertical: deviceSize.height * 0.03),
          padding: EdgeInsets.symmetric(
              horizontal: deviceSize.width * 0.03,
              vertical: deviceSize.height * 0.01),
          decoration: BoxDecoration(
            
            color: themeNotifier.isDark ? Colors.black45 : Colors.grey.shade300,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintext,
              border: InputBorder.none,
            ),
          ),
        );
      },
    );
  }
}
