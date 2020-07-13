import 'package:Home/services/apartments_firestore_services.dart';
import 'package:Home/utils/chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterScreen extends StatefulWidget {
  
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _selected = false;
  bool _selected1 = false;
  bool _selected2 = false;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Screen'),
        backgroundColor: Colors.pink[300],
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            leading: Icon(
              FontAwesomeIcons.bed,
              color: Theme.of(context).hintColor,
            ),
            title: Text(
              'Number of Bedrooms',
            ),
            subtitle: Text('select your choice of bedrooms'),
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              RawChip(
                labelPadding: EdgeInsets.all(5.0),
                label: Text(
                  '1 BHK',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.grey,
                selectedColor: Colors.pink[300],
                selected: _selected,
                onSelected: (bool value) {
                  setState(() {
                    _selected = true;
                   
                  });
                },
                onDeleted: () {
                  setState(() {
                    _selected = false;
                  });
                },
                elevation: 6.0,
                shadowColor: Colors.grey[60],
                padding: EdgeInsets.all(6.0),
              ),
              SizedBox(
                width: 10,
              ),
              RawChip(
                labelPadding: EdgeInsets.all(5.0),
                label: Text(
                  '2 BHK',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.grey,
                selectedColor: Colors.pink[300],
                selected: _selected1,
                onSelected: (bool value) {
                  setState(() {
                    _selected1 = true;
                   
                  });
                },
                onDeleted: () {
                  
                  setState(() {
                     _selected1 = false;
                  });
                  
                },
                elevation: 6.0,
                shadowColor: Colors.grey[60],
                padding: EdgeInsets.all(6.0),
              ),
              SizedBox(
                width: 10,
              ),
              RawChip(
                labelPadding: EdgeInsets.all(5.0),
                label: Text(
                  '3 BHK',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.grey,
                selectedColor: Colors.pink[300],
                selected: _selected2,
                onSelected: (bool value) {
                  setState(() {
                    _selected2 = true;
                  });
                },
                onDeleted: () {
                  _selected2 = false;
                },
                elevation: 6.0,
                shadowColor: Colors.grey[60],
                padding: EdgeInsets.all(6.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}
