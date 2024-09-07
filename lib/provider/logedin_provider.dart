import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProviders with ChangeNotifier{
  bool _wait=true;
  bool get wait=>_wait;
  setWait(bool value){
    value=_wait;
    notifyListeners();
  }



  Future<void> LogIn(String email,String pass)async{
    setWait(true);
    try{
      Response response=await post(Uri.parse('https://reqres.in/api/login'),
          body:{
            'email':email,
            'password':pass
          }
      );
      if(response.statusCode==200){
        setWait(true);
        SnackBar(content: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade700,
          ),
          child: const Center(child: Text("loged In successfully"),),
        ));
      }else{
        setWait(true);
        SnackBar(content: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade700,
          ),
          child: const Center(child: Text("email is password is wrong"),),
        ));
      }

    }catch(e){
      setWait(false);
      print(e.toString());
    }

  }
}