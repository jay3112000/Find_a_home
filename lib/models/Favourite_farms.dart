class FavFarm {
  String farmID;
  String name;
  int budget;
  String address;
  String type;
  String bedrooms;
  String imageurl;
  bool isfavourite;
 FavFarm({
    this.farmID,
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
      'farmID': farmID,
      'name': name,
      'budget': budget,
      'address': address,
      'type': type,
      'bedrooms': bedrooms,
      'imageurl': imageurl,
     'isfavourite':isfavourite
    };
  }

 FavFarm.favfromFirestore(Map<String, dynamic> firestore)
      : farmID = firestore['farmID'],
        name = firestore['name'],
        budget = firestore['budget'],
        address = firestore['address'],
        type = firestore['type'],
        bedrooms = firestore['bedrooms'],
        imageurl = firestore['imageurl'],
        isfavourite=firestore['isfavourite'];
}
