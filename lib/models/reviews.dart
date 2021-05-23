import 'package:flutter/material.dart';

class Review {
  String userid;
  String review;

  Review({this.userid, this.review});

  Review.fromFirestore(Map<String, dynamic> firestore)
      : userid = firestore['useremail'],
        review = firestore['review'];
}
