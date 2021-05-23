class Houses {
  String houseID;
  String name;
  int budget;
  String address;
  String type;
  String bedrooms;
  String imageurl;
 bool isfavourite;
  Houses({
    this.houseID,
    this.name,
    this.budget,
    this.address,
    this.bedrooms,
    this.imageurl,
    this.type,
    this.isfavourite
  });
  Map<String, dynamic> toMap() {
    return {
      'houseID': houseID,
      'name': name,
      'budget': budget,
      'address': address,
      'type': type,
      'bedrooms': bedrooms,
      'imageurl': imageurl,
       'isfavourite':isfavourite
    };
  }

  Houses.fromFirestore(Map<String, dynamic> firestore)
      : houseID = firestore['houseID'],
        name = firestore['name'],
        budget = firestore['budget'],
        address = firestore['address'],
        type = firestore['type'],
        bedrooms = firestore['bedrooms'],
        imageurl = firestore['imageurl'],
         isfavourite=firestore['isfavourite'];
}
