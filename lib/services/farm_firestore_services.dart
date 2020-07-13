import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Home/models/farm.dart';

class FarmFirestoreService{
Firestore _db = Firestore.instance;

 Stream<List<Farm>> getFarms(){
    return _db.collection('properties').document('jaipur').collection('Farm').snapshots().map((snapshot) => snapshot.documents.map((document) => Farm.fromFirestore(document.data)).toList());
  }

}