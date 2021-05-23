import 'package:cloud_firestore/cloud_firestore.dart';

class Apartments {
  String apartmentID;
  String name;
  int budget;
  String address;
  String type;
  String bedrooms;
  String imageurl;
  bool isfavourite;
  /*String reveiwId;
  String review;*/
  Apartments({
    this.apartmentID,
    this.name,
    this.budget,
    this.address,
    this.bedrooms,
    this.imageurl,
    this.type,
    this.isfavourite,
    /*this.reveiwId,
    this.review,*/
  });
  Map<String, dynamic> toMap() {
    return {
      'apartmentID': apartmentID,
      'name': name,
      'budget': budget,
      'address': address,
      'type': type,
      'bedrooms': bedrooms,
      'imageurl': imageurl,
      'isfavourite': isfavourite
    };
  }

  Apartments.fromFirestore(Map<String, dynamic> firestore)
      : apartmentID = firestore['apartmentID'],
        name = firestore['name'],
        budget = firestore['budget'],
        address = firestore['address'],
        type = firestore['type'],
        bedrooms = firestore['bedrooms'],
        imageurl = firestore['imageurl'],
        isfavourite = firestore['isfavourite'];

  static fromFireStore(DocumentSnapshot doc) {}
  /*reveiwId = firestore['reveiwId'],
        review = firestore['review'];*/
}
