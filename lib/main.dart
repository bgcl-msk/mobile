import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'Screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'dark theme/theme_model.dart';


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
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer(
        builder: (context, ThemeModel themeNotifier, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            // useInheritedMediaQuery: true,
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
