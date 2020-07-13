class Farm {
  String farmID;
  String name;
  String budget;
  String address;
  String type;
  int bedrooms;
  String imageurl;

 Farm({
    this.farmID,
    this.name,
    this.budget,
    this.address,
    this.bedrooms,
    this.imageurl,
    this.type,
  });
  Map<String, dynamic> toMap() {
    return {
      'farmID': farmID,
      'name': name,
      'budget': budget,
      'address': address,
      'type': type,
      'bedrooms': bedrooms,
      'imageurl': imageurl,
    };
  }

  Farm.fromFirestore(Map<String, dynamic> firestore)
      : farmID = firestore['farmID'],
        name = firestore['name'],
        budget = firestore['budget'],
        address = firestore['address'],
        type = firestore['type'],
        bedrooms = firestore['bedrooms'],
        imageurl = firestore['imageurl'];
}
