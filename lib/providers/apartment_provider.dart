import 'package:Home/models/apartments.dart';
import 'package:Home/models/reviews.dart';
import 'package:Home/screens/review.dart';
import 'package:Home/services/apartments_firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Home/models/apartments.dart';
import 'package:Home/models/favorite_apartments.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ApartmentProvider with ChangeNotifier {
  final firestoreService = ApartmentFirestoreService();

  Firestore _db = Firestore.instance;
  String _apartmentID;
  String _name;
  String _budget;
  String _address;
  String _type;
  String _bedrooms;
  String _imageurl;
  bool _isfavourite;
  /*String _reviewId;
  String _review;*/

  //gettersl[]
  String get apartmentID => _apartmentID;
  String get name => _name;
  String get budget => _budget;
  String get address => _address;
  String get type => _type;
  String get bedrooms => _bedrooms;
  String get imageurl => _imageurl;
  bool get isfavourite => _isfavourite;
  /*String get reviewId => _reviewId;
  String get review => _review;*/
  Future<void> setfav(bool value, String name) {
    return _db
        .collection('properties')
        .document('jaipur')
        .collection('apartments')
        .document(name)
        .updateData({"isfavourite": value});
  }

  Future<String> finishedBook(
      String name, String review, String uid, String useremail) async {
    String retVal = "error";
    
    try {
      await _db
          .collection("properties")
          .document('jaipur')
          .collection("apartments")
          .document(name)
          .collection("reviews")
          .document(uid)
          .setData({'review': review, 'useremail': useremail});
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Stream<List<Apartments>> getApartmentsreview(String name) {
    return _db
        .collection('properties')
        .document('jaipur')
        .collection('apartments')
        .document(name)
        .collection('reviews')
        .snapshots()
        .map((snapshot) => snapshot.documents
            .map((document) => Apartments.fromFirestore(document.data))
            .toList());
  }



 
}
