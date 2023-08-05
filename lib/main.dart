import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Auth/change_password.dart';
import 'Auth/forget_password.dart';
import 'Auth/provide_otp.dart';
import 'dark theme/theme_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer(
        builder: (context, ThemeModel themeNotifier, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
            home: const ChangePassword(),
          );
        },
      ),
    );
  }
}

// class ForgetPassword extends StatefulWidget {
//   @override
//   State<ForgetPassword> createState() => _ForgetPasswordState();
// }

// class _ForgetPasswordState extends State<ForgetPassword> {
//   final _commentController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (context, ThemeModel themeNotifier, child) {
//         return Scaffold(
//           appBar: AppBar(
//             actions: [
//               IconButton(
//                   onPressed: () {
//                     themeNotifier.isDark
//                         ? themeNotifier.isDark = false
//                         : themeNotifier.isDark = true;
//                   },
//                   icon: Icon(themeNotifier.isDark
//                       ? Icons.nightlight_round
//                       : Icons.wb_sunny))
//             ],
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text(
//                   'You have pushed the button this many times:',
//                 ),
//                 Container(
//                   height: 100,
//                   width: double.infinity,
//                   color: themeNotifier.isDark ? Colors.white70 : Colors.black,
//                   child: Center(
//                     child: Text(
//                       'Titus',
//                       style: TextStyle(
//                         color:
//                             themeNotifier.isDark ? Colors.black : Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 const PrimaryButton(
//                   buttonName: 'Submit',
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 MyTextField(
//                   height: 50,
//                   controller: _commentController,
//                   hintext: 'Email/Contact',
                  
//                   keyboardType: TextInputType.multiline,
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
