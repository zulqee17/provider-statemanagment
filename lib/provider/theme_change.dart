import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{
  var _themeMode=ThemeMode.light;
   ThemeMode get themeMode=>_themeMode;

   void themeChanger(themeMode){
     _themeMode=themeMode;
     notifyListeners();
   }
}