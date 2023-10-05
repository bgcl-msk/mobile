

class SupportModel {
  String iconURL; // Image URL
  String msg;
 

 
SupportModel({required this.iconURL, required this.msg});
 
}

List<SupportModel> getSupportModel = [
  SupportModel(iconURL: 'assets/images/supportchild1.png', msg: 'Contact Live Chat'),
  SupportModel(iconURL: 'assets/images/supportchild2.png', msg: 'Send us an Email'),
  SupportModel(iconURL: 'assets/images/supportchild3.png', msg: 'FAQs'),
];

