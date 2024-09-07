import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier{

  bool _wait=false;
  bool get wait=>_wait;
   setLoading(bool value){
    value=_wait;
    notifyListeners();
  }

  bool _toggle=true;
   bool get toggle=>_toggle;
   setToggle(bool value){
     value=_toggle ;
     notifyListeners();
   }


  void login(String email,String password)async{
     setLoading(true);
    try{
      Response response=await post(Uri.parse('https://reqres.in/api/login'),
          body: {
            'email':email,
            'password':password
          }
      );
      if(response.statusCode==200){
        setLoading(false);
        print("login successful");
        const SnackBar(content: Center(child: Text("Login Successful..")));
      }else{
        setLoading(false);
        print("Login Failed...");
      }
    }catch(e){
      setLoading(false);
      print(e.toString());
    }

  }
}