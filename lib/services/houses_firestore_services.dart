import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Home/models/houses.dart';

class HousesFirestoreService{
Firestore _db = Firestore.instance;

 Stream<List<Houses>> getHouses(){
    return _db.collection('properties').document('jaipur').collection('houses').snapshots().map((snapshot) => snapshot.documents.map((document) => Houses.fromFirestore(document.data)).toList());
  }

}