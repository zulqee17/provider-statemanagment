import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagment_series/provider/count_provider.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   final countProvider=Provider.of<CountProvider>(context,listen: false);
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     countProvider.setCount();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print("build");
    final countProvider=Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Count Example Using Provider"),
      ),
      body: Center(
        child:Consumer<CountProvider>(builder: (context,value,child){
          print("only this widget builds");
          return Text(value.count.toString(),style: TextStyle(fontSize:50 ),);
        },)),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
