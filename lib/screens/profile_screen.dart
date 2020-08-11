import 'package:flutter/material.dart';
import 'package:Home/utils/TextStyles.dart';
import 'package:Home/utils/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        title: BoldText("Profile", 25, kblack),
        centerTitle: true,
        elevation: 0.0,
         actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
                value: 'logout',
              ),
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: kpink2,
                    radius: 50,
                    child: Icon(Icons.person,size: 50,color: Colors.white,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      BoldText("Jay Sharma",20.0,kblack),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          NormalText("jaipur",kgreyDark,16),
                          Icon(
                            Icons.location_on,
                            color: kgreyDark,
                            size: 15.0,
                          ),
                        ],
                      ),
                    ],
                  ),


                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              height: 2,
              color: kgreyFill,
            ),
            ProfileItem(Icons.person,"My Informations"),
            SizedBox(height: 10,),
            ProfileItem(Icons.credit_card,"Payment"),
               SizedBox(height: 10,),
            ProfileItem(Icons.settings,"Settings"),
               SizedBox(height: 10,),
            ProfileItem(Icons.help,"Help"),
               SizedBox(height: 10,),
              ProfileItem(Icons.favorite_border,"Favourite"),
                 SizedBox(height: 10,),
            ProfileItem(Icons.library_books,"Terms and Conditions"),
               SizedBox(height: 10,),
            ProfileItem(Icons.info,"About Us "),
               SizedBox(height: 10,),
            ProfileItem(Icons.exit_to_app,"Sign Out"),


          ],
        ),
      ),
    );
  }

  Widget ProfileItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,bottom: 9),
      child: Row(
              children: <Widget>[
                Icon(icon, color: kpink2,size: 40,),
                
                SizedBox(width: 8,),
                NormalText(text,kblack,20.0)
              ],
            ),
    );
  }
}
