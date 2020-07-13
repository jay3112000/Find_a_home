class Rentals {
  String rentalID;
  String name;
  String budget;
  String address;
  String type;
  int bedrooms;
  String imageurl;

 Rentals({
    this.rentalID,
    this.name,
    this.budget,
    this.address,
    this.bedrooms,
    this.imageurl,
    this.type,
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
    };
  }

  Rentals.fromFirestore(Map<String, dynamic> firestore)
      : rentalID = firestore['rentalID'],
        name = firestore['name'],
        budget = firestore['budget'],
        address = firestore['address'],
        type = firestore['type'],
        bedrooms = firestore['bedrooms'],
        imageurl = firestore['imageurl'];
}
