import 'package:Home/models/reviews.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Test extends StatefulWidget {
  static const routename = '/review';
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    final rev = Provider.of<List<Review>>(context).toList();
    return Scaffold(
      body: 
         ListView.builder(
                                        itemCount: rev.length,
                                        itemBuilder: (context, index) {
                                          Review revi = rev[index];
                                          return Text(revi.userid);
                                        })
    
    );
  }
}