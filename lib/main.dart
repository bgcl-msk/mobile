import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme_manager/flutter_theme_manager.dart';
import 'package:provider/provider.dart';
import 'Screens/splash_screen.dart';
import 'package:get/get.dart';

import 'dark theme/darkTheme.dart';
import 'dark theme/themeClass.dart';
import 'widgets/model/OrganizationDataProvider.dart';

void main() {
  runApp(
  DevicePreview(
    builder: (context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OrganizationDataProvider()),
        ChangeNotifierProvider(create: (context) => BusinessDataProvider()),
      ],
      child: const MyStoreKeeper(),
    ),
    enabled: true,
  ),
);

}


class MyStoreKeeper extends StatefulWidget {
  const MyStoreKeeper({Key? key}) : super(key: key);

  @override
  State<MyStoreKeeper> createState() => _MyStoreKeeperState();
}

class _MyStoreKeeperState extends State<MyStoreKeeper> {

  // ThemeMode _themeMode = ThemeMode.light;

  // void _toggleTheme() {
  //   setState(() {
  //     _themeMode = _themeMode == ThemeMode.light
  //         ? ThemeMode.dark
  //         : ThemeMode.light;
  //   });
  // }
  final bool _iconBool = false;
  @override
  Widget build(BuildContext context) {
    

    
        return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        //themeMode: currentThemeMode,
        theme: ThemeClass.lightTheme,
        //theme: _iconBool ? ThemeClass.lightTheme : ThemeClass.darkTheme,
        darkTheme: ThemeClass.darkTheme,
        home: const SplashScreen(),
      );
      
  }
}
