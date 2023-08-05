import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'Screens/splash_screen.dart';


void main() {
  runApp(
      // DevicePreview(builder: (context)=> const MyStoreKeeper(),
      //     enabled: true,
      // )
    const MyStoreKeeper()
  );


}

class MyStoreKeeper extends StatelessWidget {
  const MyStoreKeeper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      home: SplashScreen(),
    );
  }
}
