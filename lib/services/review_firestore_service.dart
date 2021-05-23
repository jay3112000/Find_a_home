import 'package:Home/models/apartments.dart';
import 'package:Home/models/reviews.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 List<Apartments> FinalCoursesList = [] ;
ReviewApartment() async
{
     List list_of_review = await            
     Firestore.instance .collection('properties')
        .document('jaipur')
        .collection('apartments')
    .getDocuments()
    .then((val) => val.documents);
for (int i=0; i<list_of_review.length; i++)
    {
         Firestore.instance.collection("properties")..document('jaipur')
        .collection('apartments').document(
      list_of_review[i].documentID.toString()).collection("courses").snapshots().listen(CreateListofCourses);
     }

     
}
CreateListofCourses(QuerySnapshot snapshot)async 
{
       var docs = snapshot.documents;
       for (var Doc in docs)
         {
          ReviewApartment().add(Apartments.fromFireStore(Doc));
         }
}