import 'package:Home/models/farm.dart';
import 'package:Home/services/apartments_firestore_services.dart';
import 'package:Home/services/farm_firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class FarmProvider with ChangeNotifier {
 

  String _farmID;
  String _name;
  String _budget;
  String _address;
  String _type;
  int  _bedrooms;
  String _imageurl;

  //getters
   String get farmID=>_farmID;
  String get name=>_name;
  String get budget=>_budget;
  String get address=>_address;
  String get type=>_type;
  int get bedrooms=>_bedrooms;
  String get imageurl =>_imageurl;

}
