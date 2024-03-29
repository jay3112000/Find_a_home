import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Home/models/apartments.dart';
import 'package:Home/models/favorite_apartments.dart';
import 'package:Home/providers/favapartment_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class ApartmentFirestoreService {
  Firestore _db = Firestore.instance;

  /*Function getrooms(int value) {
    rooms = value;
    print(rooms);
  }*/
  
  Stream<List<Apartments>> getApartments() {
    return _db
        .collection('properties')
        .document('jaipur')
        .collection('apartments')
        .snapshots()
        .map((snapshot) => snapshot.documents
            .map((document) => Apartments.fromFirestore(document.data))
            .toList());
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
