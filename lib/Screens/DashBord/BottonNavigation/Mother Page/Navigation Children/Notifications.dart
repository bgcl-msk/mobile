import 'package:flutter/material.dart';


import '../../../../../widgets/DashBordAppBar/appBar.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar:  CustomAppBar(child: Text('Notifications')),
      body:  Center(
        child: Text('Notifications'),
      ),
     
    );
  }
}