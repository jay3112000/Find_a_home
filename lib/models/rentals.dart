class Rentals {
  String rentalID;
  String name;
  int budget;
  String address;
  String type;
  String bedrooms;
  String imageurl;
 bool isfavourite;
 Rentals({
    this.rentalID,
    this.name,
    this.budget,
    this.address,
    this.bedrooms,
    this.imageurl,
    this.type,
    this.isfavourite,
  });
  Map<String, dynamic> toMap() {
    return {
      'rentalID': rentalID,
      'name': name,
      'budget': budget,
      'address': address,
      'type': type,
      'bedrooms': bedrooms,
      'imageurl': imageurl,
       'isfavourite':isfavourite
    };
  }

  Rentals.fromFirestore(Map<String, dynamic> firestore)
      : rentalID = firestore['rentalID'],
        name = firestore['name'],
        budget = firestore['budget'],
        address = firestore['address'],
        type = firestore['type'],
        bedrooms = firestore['bedrooms'],
        imageurl = firestore['imageurl'],
          isfavourite=firestore['isfavourite'];
}
