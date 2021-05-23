import 'package:Home/models/reviews.dart';
import 'package:Home/services/review_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Reviewprovider with ChangeNotifier {
  Firestore _db = Firestore.instance;

  String _userid;
  String _review;
  String _name;

  String get userid => _userid;
  String get review => _review;
  String get name => _name;

  void getname(String n) {
   var name = n;
    notifyListeners();
    print(name);
  }

  Stream<List<Review>> getReviews() {
    
    print("hdbuiseocnsoicnsd");
    return _db
        .collection('properties')
        .document('jaipur')
        .collection('apartments')
        .document(name)
        .collection('reviews')
        .snapshots()
        .map((snapshot) => snapshot.documents
            .map((document) => Review.fromFirestore(document.data))
            .toList());
  }
}
