import 'package:Home/models/apartments.dart';
import 'package:Home/services/apartments_firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:Home/models/apartments.dart';
import 'package:Home/services/apartments_firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Home/models/apartments.dart';
import 'package:Home/models/favorite_apartments.dart';
class FavApartmentProvider with ChangeNotifier {
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

  //getters
  String get apartmentID => _apartmentID;
  String get name => _name;
  String get budget => _budget;
  String get address => _address;
  String get type => _type;
  String get bedrooms => _bedrooms;
  String get imageurl => _imageurl;
  bool get isfavourite => _isfavourite;

  Future<void> setfav(bool value,String name) {
    return _db
        .collection('properties')
        .document('jaipur')
        .collection('apartments')
        .document(name)
        .updateData({"isfavourite": value});
  }
Stream<List<FavApartments>> getfavApartments() {
   
    return _db
        .collection('properties')
        .document('jaipur')
        .collection('apartments')
        .where('isfavourite',isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.documents
            .map((document) => FavApartments.favfromFirestore(document.data))
            .toList());
  }
  
  
}
