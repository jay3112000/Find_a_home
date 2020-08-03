import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  List<String> _waxLines;
  List<String> _budget;
  int _min;
  int _max;

  SettingsProvider() {
    _waxLines = ['1', '2'];
    _budget = [
      '10k',
      '50k',
      '1lac',
      '5lac',
      '10lac',
      '25lac',
      '50lac',
      '75lac',
      '1cr'
    ];
    _min;
    _max;

    loadPreferences();
  }

  //Getters

  List<String> get waxLines => _waxLines;
  List<String> get budget => _budget;
  int get min => _min;
  int get max => _max;
  //Setters
  void setUnits(String units) {
    notifyListeners();                
    savePreferences();       
  }

  void _setWaxLines(List<String> waxLines) {
    _waxLines = waxLines;
    notifyListeners();
  }

  void _setbudget(List<String> budget) {
    _budget = budget;
    notifyListeners();
  }

  void addWaxLine(String waxLine) {
    if (_waxLines.contains(waxLine) == false) {
      _waxLines.add(waxLine);
      notifyListeners();
      savePreferences();
    }
  }
  void setMin(int value){

  }

  void addbudget(String budget, String budget1) {
    if (_budget.contains(budget) == false &&
        _budget.contains(budget1) == false) {
      _budget.add(budget);
      _budget.add(budget1);
      notifyListeners();
      savePreferences();
    }
  }

  void removeWaxLine(String waxLine) {
    if (_waxLines.contains(waxLine) == true) {
      _waxLines.remove(waxLine);
      notifyListeners();
      savePreferences();
    }
  }

  void removebudget(String budget, String budget1) {
    if (_budget.contains(budget) == true && _budget.contains(budget1) == true) {
      _budget.remove(budget);
      _budget.remove(budget1);
      notifyListeners();
      savePreferences();
    }
  }

  savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList('waxLines', _waxLines);
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> waxLines = prefs.getStringList('waxLines');

    if (waxLines = null) _setWaxLines(waxLines);
  }
}
