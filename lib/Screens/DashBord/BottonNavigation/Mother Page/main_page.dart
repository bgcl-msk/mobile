import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';


import '../../../../widgets/button widgets/FABs/business_fab.dart';
import 'Navigation Children/organization bank/organizationCenter.dart';
import '../../../../dark theme/theme_model.dart';
import '../../../../widgets/button widgets/FABs/organization_fab.dart';
import 'Navigation Children/Notifications.dart';
import 'Navigation Children/Business Bank/business.dart';
import 'Navigation Children/home.dart';
import 'Navigation Children/organization bank/organizations.dart';
import 'Navigation Children/support.dart';

class MotherPage extends StatefulWidget {
  const MotherPage({Key? key}) : super(key: key);

  @override
  State<MotherPage> createState() => _MotherPageState();
}

class _MotherPageState extends State<MotherPage> {
  int currentIndex = 0;
  List<Widget> screens = [
    const Home(),
    OrganizationHome(),
    //const Organization(),
     Business(),
    
    const Notifications(),
    const Support(),
    //const Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF1D4771),
        iconSize: 20,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            // backgroundColor: Color(0XFF3B3A38),
            activeIcon: ImageIcon(AssetImage("assets/images/home-active.png")),
            icon: ImageIcon(AssetImage("assets/images/home.png")),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon:
                ImageIcon(AssetImage("assets/images/organization-active.png")),
            icon: ImageIcon(AssetImage("assets/images/organization.png")),
            label: 'Organization',
          ),
          BottomNavigationBarItem(
            activeIcon: ImageIcon(AssetImage("assets/images/business.png")),
            icon: ImageIcon(AssetImage("assets/images/business.png")),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            activeIcon:
                ImageIcon(AssetImage("assets/images/notification-active.png")),
            icon: ImageIcon(AssetImage("assets/images/notification.png")),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            activeIcon:
                ImageIcon(AssetImage("assets/images/support-active.png")),
            icon: ImageIcon(AssetImage("assets/images/support.png")),
            label: 'Support',
          ),
          // BottomNavigationBarItem(
          //   activeIcon: ImageIcon(AssetImage("assets/images/profile-active.png")),
          //   icon: ImageIcon(AssetImage("assets/images/profile.png")),
          //   label: 'Account',
          // ),
        ],
      ),
      floatingActionButton: SpeedDialFabWidget(
        primaryIconCollapse: Icons.close,
        primaryIconExpand: Icons.add,
        secondaryIconsList: const [
          Icons.shop,
          Icons.warehouse,
          Icons.business,
          Icons.group
        ],
        secondaryIconsText: const [
          "Shop",
          "Warehouse",
          "Business",
          "Organization",
        ],
        secondaryIconsOnPress: [
          () => {},
          () => {},
          () => {
            showModalBottomSheet<void>(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.0)),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    
                    return const BusinessFAB(); // Use your custom bottom sheet here
                  },
                  
                ),
          },
          () => {
            
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.0)),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    
                    return const OrganizationFAB(); // Use your custom bottom sheet here
                  },
                  
                ),
                
              }
        ],
        // secondaryBackgroundColor: Colors.green,
        secondaryForegroundColor: const Color(0xFF00376D),
        primaryBackgroundColor: const Color(0xFF00376D),
        primaryForegroundColor: Colors.white,
      ),
    );
    // });
  }

  // BottomNavigationBar buildBottomNavigationBar() {
  //   return   }
}
