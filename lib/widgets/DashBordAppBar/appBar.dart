import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../dark theme/themeClass.dart';



class CustomAppBar extends StatefulWidget with PreferredSizeWidget {

  const CustomAppBar({super.key, required this.child});
  final Widget child;


  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(85.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  //Size get preferredSize => const Size.fromHeight(85.0);

  final IconData lightIcon = Icons.wb_sunny;

  final IconData darkIcon = Icons.nightlight_round;

  ThemeData _currentTheme = ThemeClass.lightTheme;
  ThemeMode currentThemeMode = ThemeMode.system;

  void _toggleLightTheme() {
    setState(() {
      currentThemeMode = ThemeMode.dark;
    });
  }

  void _toggleDarkTheme() {
    setState(() {
      currentThemeMode = ThemeMode.light;
    });
  }

   bool _iconBool = false;


  @override
  Widget build(BuildContext context) {
    //final themeManager = ThemeManager();
   
    return AppBar(
        //backgroundColor: const Color(0xFF00376D),
        backgroundColor:Theme.of(context).appBarTheme.backgroundColor ,
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
        title: widget.child,
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
                    //   Get.isDarkMode
                    // ? Get.changeTheme(ThemeClass.lightTheme)
                    // : Get.changeTheme(ThemeClass.darkTheme);
                    Get.changeTheme(ThemeClass.lightTheme);
                     },
                    child: Icon(lightIcon,size: 15,color: Colors.white,)),
                    const SizedBox(width: 7,),
                  GestureDetector(
                    onTap: (){
                      Get.changeTheme(ThemeClass.darkTheme);
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
