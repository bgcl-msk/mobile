import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../widgets/button widgets/secondary_button.dart';
import '../../../../../../widgets/model/OrganizationCard.dart';
import '../../../../../../widgets/model/OrganizationDataProvider.dart';

class UpdateOrganization extends StatefulWidget {
  
  const UpdateOrganization({Key? key,}) : super(key: key);

  @override
  State<UpdateOrganization> createState() => _UpdateOrganizationState();
}

class _UpdateOrganizationState extends State<UpdateOrganization> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<String> locationOptions = ['Location', 'Ghana, Accra, Spintex', 'Ghana, Kumasi, Titus'];
  String? selectedValue = 'Location';

@override
void initState() {
  super.initState();
  
}


  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void handleUpdate(context) {
  final organizationDataProvider = Provider.of<OrganizationDataProvider>(context, listen: false);

  final String orgName = nameController.text;
  final String orgLocation = selectedValue ?? " ";
  final String orgDescription = descriptionController.text;
  final String ids = UniqueKey().toString();

  

  final updatedCard = OrganizationCard(
    id: ids,
    name: orgName,
    location: orgLocation,
    description: orgDescription
    // Update other properties as needed
  );

  organizationDataProvider.updateCard(updatedCard);

  // Provide feedback to the user (e.g., show a snackbar or navigate back)
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Organization updated successfully!'),
    ),
  );

  // You can also navigate back to the previous page if needed
  Navigator.pop(context);
}



  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return FractionallySizedBox(
      heightFactor: 0.70,
      child: SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Update Organization',
                    style: TextStyle(fontSize: 20, fontFamily: 'Poppians',fontWeight: FontWeight.w700),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.cancel_outlined)),
                ],
              ),
              SizedBox(height: size * 0.05),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Name'),
            ),
            SizedBox(height: size * 0.05),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Location',
              ),
              items:
                  locationOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
              value: selectedValue,
            ),
            SizedBox(height: size * 0.05),
            TextField(
              controller: descriptionController,
              maxLines: 10,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Description...',
              ),
            ),
            SizedBox(height: size * 0.075),
            SecondaryButton(
              buttonName: 'Update', onPress: () {},
              color: const Color(0xFF1D4771),
              //onPress: () => handleUpdate(context)
            ),
            SizedBox(height: size * 0.05),
            SecondaryButton(
              buttonName: 'Delete', onPress: () {},
              color: const Color(0xFFEF0000),
              //onPress: () => handleUpdate(context) background: #;
            ),
          ],
        ),
      ),
    ))

      );
    
  }
}
