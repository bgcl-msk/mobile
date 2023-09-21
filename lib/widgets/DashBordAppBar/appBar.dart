import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dark theme/darkTheme.dart';
import '../../dark theme/lightTheme.dart';



class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key, required this.child});
  final Widget child;

  @override
  Size get preferredSize => const Size.fromHeight(85.0);

  final IconData lightIcon = Icons.wb_sunny;
  final IconData darkIcon = Icons.nightlight_round;
  

  @override
  Widget build(BuildContext context) {
    //final themeManager = ThemeManager();
   
    return AppBar(
        backgroundColor: const Color(0xFF00376D),
        centerTitle: true,
        leading: Column(
          children: [
            Image.asset(
              'assets/images/profile.png',
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            const Text('Titus')
          ],
        ),
        title: child,
        flexibleSpace: Align(
          alignment: Alignment.centerRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      lightTheme;
                    },
                    child: Icon(lightIcon,size: 15,color: Colors.white,)),
                    const SizedBox(width: 7,),
                  GestureDetector(
                    onTap: (){darkTheme;
                      //Get.changeTheme(ThemeData.dark());
                      },
                    child: Icon(darkIcon,size: 15,color: Colors.white,)),
                    const SizedBox(width: 10,),
                ],
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, bottom: 30),
                child: Image.asset(
                  'assets/images/menu.png',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
        //

        );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
        ),
        child: Expanded(
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                    color: Color.fromRGBO(255, 255, 255, 0.5), width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                    color: Color.fromRGBO(255, 255, 255, 0.5), width: 2.0),
              ),
              hintText: 'Search Organization',
              hintStyle: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.5),
                fontSize: 12,
              ),
              filled: false,
            ),
          ),
        ));
  }
}
