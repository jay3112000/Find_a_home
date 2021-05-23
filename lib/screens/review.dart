import 'package:Home/models/apartments.dart';
import 'package:Home/providers/apartment_provider.dart';
import 'package:Home/providers/review_provider.dart';
import 'package:Home/utils/shadowcontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Home/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:Home/services/review_firestore_service.dart';

class Reviewadd extends StatefulWidget {
  final String name;
  Reviewadd(this.name);
  @override
  _ReviewaddState createState() => _ReviewaddState();
}

class _ReviewaddState extends State<Reviewadd> {
  final reviewKey = GlobalKey<ScaffoldState>();
  TextEditingController _reviewController = TextEditingController();

  //AuthModel _authModel;

  /* @override
  void didChangeDependencies() {
    _authModel = Provider.of<AuthModel>(context);
    super.didChangeDependencies();
  }*/

  @override
  Widget build(BuildContext context) {
    //final reviewfirestoresrvice = ReviewFirestoreService();
    var ap = Provider.of<ApartmentProvider>(context);
    var rev = Provider.of<Reviewprovider>(context);
    String useremail;
    String uuuid;
    AuthResult authResult;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    getCurrentUser() async {
      final FirebaseUser user = await _auth.currentUser();
      String uid = user.uid;
      final email = user.email;
      uuuid = uid;
      useremail = email;
      // Similarly we can get email as well
      //final uemail = user.email;
      print(uuuid);
      print(email);

      //print(uemail);
    }

    return Scaffold(
      key: reviewKey,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[BackButton()],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ShadowContainer(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _reviewController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: "Add A Review",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80),
                        child: Text(
                          "Add Review",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      onPressed: () {
                        // ap.finishedBook(widget.name, _reviewController.text  , authResult.user.uid);
                        rev.getReviews();
                        getCurrentUser();
                        print(uuuid);
                        print(useremail);
                        if (useremail != null)
                          ap.finishedBook(widget.name, _reviewController.text,
                              uuuid, useremail);
                      }),
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
