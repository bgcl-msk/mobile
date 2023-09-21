import 'package:flutter/material.dart';
import 'package:mobilemsk/Screens/DashBord/BottonNavigation/Mother%20Page/Navigation%20Children/organization%20bank/deleted_organization.dart';
import 'package:mobilemsk/Screens/DashBord/BottonNavigation/Mother%20Page/Navigation%20Children/organization%20bank/organizations.dart';

import 'organization_settings.dart';
import 'pendding_deletion.dart';
import '../../../../../../widgets/DashBordAppBar/appBar.dart';
// Import the DeletedOrganizationsPage widget

class OrganizationHome extends StatefulWidget {
  @override
  _OrganizationHomeState createState() => _OrganizationHomeState();
}

class _OrganizationHomeState extends State<OrganizationHome> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const CustomAppBar(child: SearchBar()),
      body: 
      Column(
        children: [
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Container(
              height: 30, 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TabBar(



                controller: _tabController,
                isScrollable: true,
                labelStyle: const TextStyle(
                fontFamily: 'Poppians',
                
              ),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),  

                  color: Color(0xFFFFE1DF),
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: 'Organization'),
                  Tab(text: 'Pending Deletion'),
                  Tab(text: 'Deleted Organization'),
                  //Tab(text: 'Organization Settings'),
                  
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:  const [
                Organization(),
                PendingOrganization(), 
                DeletedOrganizationsPage(), 
                //OrganizationSettings(), 
              ],
            ),
          ),
        ],
      ),
    );
  }
}
