import 'package:flutter/foundation.dart';

class NewExampleProvider with ChangeNotifier{
  double _value=1.0;
  double get value=>_value;

  void setChange(double val){
    _value=val;
    notifyListeners();
  }
}