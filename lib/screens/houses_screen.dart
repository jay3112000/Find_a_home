
import 'package:Home/utils/farmCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Home/models/houses.dart';

class HousesScreen extends StatefulWidget {
  static const routename = '/house';
  @override
  _HousesScreenState createState() => _HousesScreenState();
}

class _HousesScreenState extends State<HousesScreen> {
  @override
  Widget build(BuildContext context) {
    final houses = Provider.of<List<Houses>>(context);
    return Scaffold(
        body: (houses != null)
            ? ListView.builder(
                itemCount: houses.length,
                itemBuilder: (context, index) {
                  return FarmCard(
                      houses[index].imageurl,
                    houses[index].name,
                     houses[index].address,
                     houses[index].budget);
                })
            : Center(child: CircularProgressIndicator()));
  }
}
// title: Text(apartments[index].name),
//      trailing: Text(apartments[index].bedrooms.toString()),