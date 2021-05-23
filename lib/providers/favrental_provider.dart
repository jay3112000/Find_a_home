import 'package:Home/models/favourite_rentals.dart';
import 'package:Home/models/rentals.dart';
import 'package:Home/services/apartments_firestore_services.dart';
import 'package:Home/services/rental_firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
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
class FavRentalProvider with ChangeNotifier {
  final firestoreService = RentalFirestoreService();
  Firestore _db = Firestore.instance;
  String _rentalID;
  String _name;
  String _budget;
  String _address;
  String _type;
  int _bedrooms;
  String _imageurl;

  //getters
  String get rentalID => _rentalID;
  String get name => _name;
  String get budget => _budget;
  String get address => _address;
  String get type => _type;
  int get bedrooms => _bedrooms;
  String get imageurl => _imageurl;

  Future<void> setfav(bool value, String name) {
    return _db
        .collection('properties')
        .document('jaipur')
        .collection('Rentals')
        .document(name)
        .updateData({"isfavourite": value});
  }

  Stream<List<FavRentals>> getfavRentals() {
    return _db
        .collection('properties')
        .document('jaipur')
        .collection('Rentals')
        .where('isfavourite', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.documents
            .map((document) => FavRentals.favfromFirestore(document.data))
            .toList());
  }
}
