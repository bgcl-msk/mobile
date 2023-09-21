import 'package:flutter/material.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';

import '../../../../../widgets/DashBordAppBar/appBar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(
          child: ImageIcon(
        size: 70,
        color: Colors.white,
        AssetImage(
          'assets/images/msklogo.png',
        ),
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/no-organization.png',
              height: 100,
            ),
          ),
          const Center(
            child: Text(
              'No business has been created',
              style: TextStyle(
                fontFamily: 'Poppians',
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
