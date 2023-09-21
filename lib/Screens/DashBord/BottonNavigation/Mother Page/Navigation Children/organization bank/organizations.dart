import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../widgets/model/OrganizationCard.dart';
import '../../../../../../widgets/model/OrganizationDataProvider.dart';
import 'update_organization.dart';

class Organization extends StatefulWidget {
  const Organization({super.key});

  @override
  State<Organization> createState() => _OrganizationState();
}

class _OrganizationState extends State<Organization> {
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
    double size = MediaQuery.of(context).size.width;
    final organizationDataProvider =
        Provider.of<OrganizationDataProvider>(context);

    void handleClick(int item, OrganizationCard organizationCard) {
      switch (item) {
        case 0:
          organizationDataProvider.removeCard(organizationCard);
          break;
        case 1:
          break;
      }
    }

    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.background,

      body: Consumer<OrganizationDataProvider>(
        builder: (context, dataProvider, _) {
          final cards = dataProvider.cards;
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final card = cards[index];
              return SizedBox(
                height: 160,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: const EdgeInsets.all(5),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 33, bottom: 15, right: 20, top: 10),
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
                                   fontFamily: 'Poppians',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  card.location,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Poppians',
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
                                    value: 0, child: Text('Delete')),
                                PopupMenuItem<int>(
                                    value: 1, child: Text('View Info')),
                              ],
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              //margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.grey, // Border color
                                  
                                  width: 0.1, // Border width
                                ),
                              ),
                              child: Text(
                                cdate,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppians',
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(15.0)),
                                  ),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const UpdateOrganization();
                                  },
                                );
                              },
                              child: const ImageIcon(
                                AssetImage("assets/images/edit.png"),
                                size: 35,
                              ),
                            ),
                            
                          ],
                        ),
                      ],
                    ),
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
