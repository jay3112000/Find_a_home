import 'package:Home/models/apartments.dart';
import 'package:Home/utils/apartmentCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Home/models/apartments.dart';

class ApartmentScreen extends StatefulWidget {
  static const routename = '/apartment';
  @override
  _ApartmentScreenState createState() => _ApartmentScreenState();
}

class _ApartmentScreenState extends State<ApartmentScreen> {
  @override
  Widget build(BuildContext context) {
    final apartments = Provider.of<List<Apartments>>(context);
    return Scaffold(
        body: (apartments != null)
            ? ListView.builder(
                itemCount: apartments.length,
                itemBuilder: (context, index) {
                  return ApartmentCard(
                      apartments[index].imageurl,
                      apartments[index].name,
                      apartments[index].address,
                      apartments[index].budget);
                })
            : Center(child: CircularProgressIndicator()));
  }
}
// title: Text(apartments[index].name),
//      trailing: Text(apartments[index].bedrooms.toString()),
