import 'package:flutter/material.dart';

import '../../../../../widgets/DashBordAppBar/appBar.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(child: Text('Support')),
      body: Center(
        child: Text('Support'),
      ),
    );
  }
}