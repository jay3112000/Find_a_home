
import 'package:Home/providers/filter_provider.dart';
import 'package:Home/utils/rentalCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Home/models/rentals.dart';

class RentalsScreen extends StatefulWidget {
  static const routename = '/rental';
  @override
  _RentalsScreenState createState() => _RentalsScreenState();
}

class _RentalsScreenState extends State<RentalsScreen> {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<SettingsProvider>(context);
    final rentals = Provider.of<List<Rentals>>(context) .where((apartment) =>
            settings.waxLines.contains(apartment.bedrooms) && apartment.budget<settings.max
        )
        .toList();
    return Scaffold(
        body: (rentals != null)
            ? ListView.builder(
                itemCount: rentals.length,
                itemBuilder: (context, index) {
                  return RentalCard(
                      rentals[index].imageurl,
                   rentals[index].name,
                     rentals[index].address,
                     rentals[index].budget,
                     rentals[index].bedrooms,
                     rentals[index].type);
                })
            : Center(child: CircularProgressIndicator()));
  }
}
// title: Text(apartments[index].name),
//      trailing: Text(apartments[index].bedrooms.toString()),
