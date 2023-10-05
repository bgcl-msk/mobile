import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../../../widgets/DashBordAppBar/appBar.dart';
import 'chats/chatting.dart';
import 'support_model.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: const CustomAppBar(child: Text('Support')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size * 0.05),
            CircleAvatar(
              radius: 65,
              backgroundColor: const Color(0xFFECE7FF),
              child: Image.asset(
                "assets/images/support1.png",
              ),
            ),
            SizedBox(height: size * 0.05),
            const Text(
              'Hello, How can we \n Help you?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppians',
                color: Color(0xFF000000),
                fontSize: 20,
              ),
            ),
            SizedBox(height: size * 0.1),
            Expanded(
              child: ListView.builder(
                itemCount: getSupportModel.length,
                itemBuilder: (context, index) {
                  final getSupport = getSupportModel[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(const ChatScreen(),
                          duration: const Duration(seconds: 1),
                          transition: Transition.native);
                    },
                    child: SizedBox(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          
                          margin: const EdgeInsets.all(5),
                          child: ListTile(
                            trailing: const Icon(Icons.arrow_forward_sharp),
                            leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: const Color(0xFFECE7FF),
                              child: ImageIcon(
                                AssetImage(getSupport.iconURL),
                                size: 24,
                              ),
                            ),
                            title: Text(getSupport.msg),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
