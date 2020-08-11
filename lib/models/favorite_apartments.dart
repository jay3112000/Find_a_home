class FavApartments {
  String apartmentID;
  String name;
  String budget;
  String address;
  String type;
  String bedrooms;
  String imageurl;
  bool isfavourite;
  FavApartments({
    this.apartmentID,
    this.name,
    this.budget,
    this.address,
    this.bedrooms,
    this.imageurl,
    this.type,
    this.isfavourite,
  });

   FavApartments.favfromFirestore(Map<String, dynamic> firestore)
      : apartmentID = firestore['apartmentID'],
        name = firestore['name'],
        budget = firestore['budget'],
        address = firestore['address'],
        type = firestore['type'],
        bedrooms = firestore['bedrooms'],
        imageurl = firestore['imageurl'],
        isfavourite = firestore['isfavourite'];
}