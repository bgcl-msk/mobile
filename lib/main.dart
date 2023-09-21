import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme_manager/flutter_theme_manager.dart';
import 'package:provider/provider.dart';
import 'Screens/splash_screen.dart';
import 'package:get/get.dart';

import 'dark theme/darkTheme.dart';
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
  @override
  Widget build(BuildContext context) {
    return themeManager(
      themeBuilder: (ThemeData ) {
        return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
    
        //darkTheme: ThemeData.dark(),
        darkTheme: darkTheme,
        theme: ThemeData ,
        themeMode: ThemeMode.system,
        home: const SplashScreen(),
      );
      }
       
    );
  }
}
