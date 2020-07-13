import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Home/models/rentals.dart';

class RentalFirestoreService{
Firestore _db = Firestore.instance;

 Stream<List<Rentals>> getRentals(){
    return _db.collection('properties').document('jaipur').collection('Rentals').snapshots().map((snapshot) => snapshot.documents.map((document) => Rentals.fromFirestore(document.data)).toList());
  }

}