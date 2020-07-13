import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Home/models/apartments.dart';

class ApartmentFirestoreService {
  Firestore _db = Firestore.instance;
  String name;
  ApartmentFirestoreService(this.name);

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
}
