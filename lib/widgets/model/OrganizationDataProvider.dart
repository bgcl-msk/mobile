import 'package:flutter/foundation.dart';

import 'OrganizationCard.dart';

class OrganizationDataProvider extends ChangeNotifier {
  final List<OrganizationCard> _cards = [];
  final List<OrganizationCard> _deletedCards = [];
  final List<OrganizationCard> _pendingDeletion = [];

  final List<OrganizationCard> _permenentDeletedCards = [];

  List<OrganizationCard> get cards => _cards;
  List<OrganizationCard> get pendingDeletion => _pendingDeletion;
  List<OrganizationCard> get deletedCards => _deletedCards;

  List<OrganizationCard> get permenentDeletedCards => _permenentDeletedCards;


  /// adding new card
  void addCard(OrganizationCard card) {
    _cards.add(card);
    notifyListeners();
  }

  /// deleting new card
  void removeCard(OrganizationCard card) {
    _cards.remove(card);
    _deletedCards.add(card); // Store the deleted card
    notifyListeners();
  }


  /// deleting Deleted organization new card
  void penddingDeletion(OrganizationCard card) {
    _deletedCards.remove(card);
    _pendingDeletion.add(card); // Store the deleted card
    notifyListeners();
  }

  /// pendding deleting new card
  void deletedOrgainization(OrganizationCard card) {
    _pendingDeletion.remove(card);
    //permenentDeletedCards.add(card); // Store the deleted card
    notifyListeners();
  }


  /// restoring deleted cars
  void restoreCard(OrganizationCard card) {
  _deletedCards.remove(card);
  _cards.add(card); // Restore the card
  notifyListeners();
}


/// Update an existing organization card
 void updateCard(OrganizationCard updatedCard) {
  final index = _cards.indexWhere((card) => card.id == updatedCard.id);
  if (index != -1) {
    _cards[index] = updatedCard;
    notifyListeners();
  }
}

}


// Business
class BusinessDataProvider extends ChangeNotifier {
final List<BusinessCard> _businessCards = [];

List<BusinessCard> get cards => _businessCards;

/// adding new Business
  void addBusiness(BusinessCard business) {
    _businessCards.add(business);
    notifyListeners();
  }
}


