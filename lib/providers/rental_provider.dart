import 'package:Home/models/rentals.dart';
import 'package:Home/services/apartments_firestore_services.dart';
import 'package:Home/services/rental_firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class RentalProvider with ChangeNotifier {
  final firestoreService = RentalFirestoreService();
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
}
