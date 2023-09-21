import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


import '../../../../../../widgets/model/OrganizationCard.dart';
import '../../../../../../widgets/model/OrganizationDataProvider.dart';

class DeletedOrganizationsPage extends StatefulWidget {
  const DeletedOrganizationsPage({super.key});

  @override
  State<DeletedOrganizationsPage> createState() => _DeletedOrganizationsPageState();
}
class _DeletedOrganizationsPageState extends State<DeletedOrganizationsPage> {
  
  @override
  Widget build(BuildContext context) {

    final organizationDataProvider =
        Provider.of<OrganizationDataProvider>(context);

    final pendingDeletedCards = organizationDataProvider.pendingDeletion;

    String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());

    void handleClick(int item, OrganizationCard organizationCard) {
      switch (item) {
        case 0:
          // Permanently delete the card
          
          //organizationDataProvider.deletedOrgainization(organizationCard);
          break;
        case 1:
          // Restore the card
          
          Navigator.pop;
          break;
      }
    }
    return   Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: pendingDeletedCards.length,
        itemBuilder: (context, index) {
          final card = pendingDeletedCards[index];
          return SizedBox(
            height: 160,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.only(left: 33,bottom: 15,right: 20,top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              card.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              card.location,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        PopupMenuButton<int>(
                          onSelected: (item) => handleClick(item, card),
                          itemBuilder: (context) => const [
                            PopupMenuItem<int>(
                                value: 0, child: Text('Approve')),
                            PopupMenuItem<int>(
                                value: 1, child: Text('Cancel')),
                          ],
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 0.1, // Border width
                            ),
                          ),
                          child: Text(
                            cdate,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        const ImageIcon(
                          AssetImage("assets/images/edit.png"),
                          size: 24,
                        ),
                      ],
                    ),
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