

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Filter with ChangeNotifier {
   int  room;

  
  void setroom(int newvalue) {
    room = newvalue;
    notifyListeners();
  }
}
