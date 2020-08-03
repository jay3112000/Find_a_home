import 'package:Home/models/apartments.dart';
import 'package:Home/utils/apartmentCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Home/models/apartments.dart';
import 'package:Home/providers/filter_provider.dart';

class ApartmentScreen extends StatefulWidget {
  static const routename = '/apartment';
  @override
  _ApartmentScreenState createState() => _ApartmentScreenState();
}

class _ApartmentScreenState extends State<ApartmentScreen> {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<SettingsProvider>(context);
    final apartments = Provider.of<List<Apartments>>(context)
        .where((apartment) =>
            settings.waxLines.contains(apartment.bedrooms)
        )
        .toList();


    return Scaffold(
        body: (apartments != null)
            ? ListView.builder(
                itemCount: apartments.length,
                itemBuilder: (context, index) {
                  Apartments apartment = apartments[index];
                  return ApartmentCard(
                    apartment.imageurl,
                    apartment.name,
                    apartment.address,
                    apartment.budget,
                    apartment.bedrooms,
                    apartment.type,
                  );
                })
            : Center(child: CircularProgressIndicator()));
  }
}
// title: Text(apartments[index].name),
//      trailing: Text(apartments[index].bedrooms.toString()),
