import 'package:Home/models/houses.dart';
import 'package:Home/services/houses_firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class HousesProvider with ChangeNotifier {
  final firestoreService = HousesFirestoreService();
  String _houseID;
  String _name;
  String _budget;
  String _address;
  String _type;
  int _bedrooms;
  String _imageurl;

  //getters
  String get houseID => _houseID;
  String get name => _name;
  String get budget => _budget;
  String get address => _address;
  String get type => _type;
  int get bedrooms => _bedrooms;
  String get imageurl => _imageurl;
}
