import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../../../../widgets/DashBordAppBar/appBar.dart';
import 'notification_model.dart';
import 'notifications_details.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();

}



class _NotificationsState extends State<Notifications> {
  String currentTime = DateFormat.jm().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: const CustomAppBar(child: Text('Notifications')),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final getNotify = notifications[index];
          final bgColor = getNotify.isRead
              ? (isDarkTheme ? const Color(0xFF32312F) : Colors.white)
              : (isDarkTheme ? const Color(0xFF32312F) : const Color(0xFFF5F5F5));

          return GestureDetector(
            onTap: () {
              setState(() {
                // Toggle the 'isRead' property when the notification is tapped again.
                getNotify.isRead = !getNotify.isRead;
              });
              Get.to(const NotificationDetail(),
                arguments: {
                  'iconURL': getNotify.iconURL,
                  'msg': getNotify.msg,
                  'time': getNotify.time,
                  'msgDisc': getNotify.msgDisc,
                },
                duration: const Duration(seconds: 1),
                transition: Transition.native,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: bgColor, // Use the bgColor variable here
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 112,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color(0xFFECE7FF),
                  child: ImageIcon(
                    AssetImage(getNotify.iconURL),
                    size: 24,
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(getNotify.msg),
                    Expanded(child: Container()),
                    Text(getNotify.time),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


// class _NotificationsState extends State<Notifications> {
//   String currentTime = DateFormat.jm().format(DateTime.now());

//   @override
//   Widget build(BuildContext context) {
//     final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
//     return Scaffold(
//       appBar: const CustomAppBar(child: Text('Notifications')),
//       body: ListView.builder(
//         itemCount: notifications.length,
//         itemBuilder: (context, index) {
//           final getNotify = notifications[index];
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 // Toggle the 'isRead' property when the notification is tapped again.
//                 getNotify.isRead = !getNotify.isRead;
//               });
//               Get.to(const NotificationDetail(),
//               arguments: {
//                 'iconURL': getNotify.iconURL,
//                 'msg': getNotify.msg,
//                 'time': getNotify.time,
//                 'msgDisc': getNotify.msgDisc,
//               },
//               duration: const Duration(seconds: 1),
//                     transition: Transition.native);
//             },
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               margin: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: getNotify.isRead
//                     ? (isDarkTheme
//                         ? const Color(0xFF32312F)
//                         : Colors.white)
//                     : (isDarkTheme
//                         ? const Color(0xFF32312F)
//                         : const Color(0xFFF5F5F5)),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               height: 112,
//               child: ListTile(
//                 leading: CircleAvatar(
//                   radius: 50,
//                   backgroundColor: const Color(0xFFECE7FF),
//                   child: ImageIcon(
//                     AssetImage(getNotify.iconURL),
//                     size: 24,
//                   ),
//                 ),
//                 title: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(getNotify.msg),
//                     Expanded(child: Container()),
//                     Text(getNotify.time),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
