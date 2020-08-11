import 'package:Home/models/favorite_apartments.dart';
import 'package:Home/utils/apartmentCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Home/providers/filter_provider.dart';

class FavApartmentScreen extends StatefulWidget {
  static const routename = '/apartment';
  @override
  _FavApartmentScreenState createState() => _FavApartmentScreenState();
}

class _FavApartmentScreenState extends State<FavApartmentScreen> {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<SettingsProvider>(context);
    final apartments = Provider.of<List<FavApartments>>(context)
      
        .toList();


    return Scaffold(
        body: (apartments != null)
            ? ListView.builder(
                itemCount: apartments.length,
                itemBuilder: (context, index) {
                  FavApartments apartment = apartments[index];
                  return ApartmentCard(
                    apartment.imageurl,
                    apartment.name,
                    apartment.address,
                    apartment.budget,
                    apartment.bedrooms,
                    apartment.type,
                    apartment.isfavourite,
                  );
                })
            : Center(child: CircularProgressIndicator()));
  }
}
// title: Text(apartments[index].name),
//      trailing: Text(apartments[index].bedrooms.toString()),
