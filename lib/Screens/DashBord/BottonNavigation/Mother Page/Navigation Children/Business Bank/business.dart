import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../widgets/DashBordAppBar/appBar.dart';
import '../../../../../../widgets/model/OrganizationDataProvider.dart';

class Business extends StatefulWidget {
  const Business({super.key});

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  String? selectedValue; // Define the selectedValue variable

  String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());

  @override
  void initState() {
    super.initState();
    // Initialize selectedValue with a default value if needed
    selectedValue = 'Option 1';
  }

  @override
  Widget build(BuildContext context) {
    //double size = MediaQuery.of(context).size.width;
    // final BusinessDataProvider =
    //     Provider.of<BusinessDataProvider>(context);

    // void handleClick(int item, BusinessCard BusinessCard) {
    //   switch (item) {
    //     case 0:
    //       BusinessDataProvider.removeCard(BusinessCard);
    //       break;
    //     case 1:
    //       break;
    //   }
    // }

    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const CustomAppBar(child: Text('Business')),

      body: Consumer<BusinessDataProvider>(
        builder: (context, dataProvider, _) {
          double size = MediaQuery.of(context).size.width;
          final businessCards = dataProvider.cards;
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: businessCards.length,
            itemBuilder: (context, index) {
              final bCard = businessCards[index];
              return SizedBox(
                height: 100,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: const EdgeInsets.all(5),
                  child: Padding(
                    padding:  EdgeInsets.only(
                        left: 33, bottom: 15, right: 20, top: 10),
                    child: Row(
                      
                      children:[
                        Text('D'),
                        SizedBox(width: size * 0.05),
                        Column(
                          
                          children: [
                            Text('fff'),
                            Text('fff'),
                            Text('fff'),
                          ]
                        ),
                        Expanded(child: Container()),
                        Column(
                        
                          children: [
                            Text('fff'),
                            Expanded(child: Container()),
                            Text('fff'),
                          ]
                        )
                      ]
                    )
                    
                    
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}








// ListTile(
//                       leading: Text('D'),
//                       title: Text(
//                         bCard.name,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                       ),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             bCard.location,
//                             style: const TextStyle(
//                               color: Colors.grey,
//                               fontSize: 16,
//                             ),
//                           ),
//                           SizedBox(height: size * 0.05),
//                           Row(
//                             children: [
//                               Text(
//                                 cdate,
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.grey,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               Expanded(child: Container()),
//                               Text(
//                             cdate,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.grey,
//                               fontSize: 16,
//                             ),
//                           ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       trailing: Text(
//                         bCard.location,
//                         style: const TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),









//Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const SizedBox(height: 15),
                    //     Row(
                    //       children: [
                    //         Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                                // Text(
                                //   bCard.name,
                                //   style: const TextStyle(
                                //     fontWeight: FontWeight.w600,
                                //     fontSize: 16,
                                //     color: Colors.black,
                                //   ),
                                // ),
                    //             const SizedBox(height: 5),
                                // Text(
                                //   bCard.location,
                                //   style: const TextStyle(
                                //     color: Colors.grey,
                                //     fontSize: 16,
                                //   ),
                                // ),
                    //           ],
                    //         ),
                    //         Expanded(child: Container()),
                    //         PopupMenuButton<int>(
                    //           onSelected: (item) => handleClick(item, card),
                    //           itemBuilder: (context) => const [
                    //             PopupMenuItem<int>(
                    //                 value: 0, child: Text('Delete')),
                    //             PopupMenuItem<int>(
                    //                 value: 1, child: Text('View Info')),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //     Expanded(child: Container()),
                    //     Row(
                    //       children: [
                    //         Container(
                    //           padding: const EdgeInsets.all(10),
                    //           //margin: const EdgeInsets.only(bottom: 10),
                    //           decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(10),
                    //             border: Border.all(
                    //               color: Colors.grey, // Border color
                    //               width: 0.1, // Border width
                    //             ),
                    //           ),
                            //   child: Text(
                            //     cdate,
                            //     style: const TextStyle(
                            //       fontWeight: FontWeight.w600,
                            //       color: Colors.black,
                            //       fontSize: 16,
                            //     ),
                            //   ),
                            // ),
                    //         Expanded(child: Container()),
                    //         InkWell(
                    //           onTap: () {
                    //             // showModalBottomSheet<void>(
                    //             //   isScrollControlled: true,
                    //             //   shape: const RoundedRectangleBorder(
                    //             //     borderRadius: BorderRadius.vertical(
                    //             //         top: Radius.circular(15.0)),
                    //             //   ),
                    //             //   context: context,
                    //             //   builder: (BuildContext context) {
                    //             //     return const UpdateBusiness();
                    //             //   },
                    //             // );
                            //   },
                            //   child: const ImageIcon(
                            //     AssetImage("assets/images/edit.png"),
                            //     size: 35,
                            //   ),
                            // ),
                    //         //const Icon(Icons.edit)
                    //       ],
                    //     ),
                    //   ],
                    // ),