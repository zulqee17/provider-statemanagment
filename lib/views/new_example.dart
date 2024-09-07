import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagment_series/provider/new_example_provider.dart';

class NewExample extends StatefulWidget {
  const NewExample({super.key});

  @override
  State<NewExample> createState() => _NewExampleState();
}

class _NewExampleState extends State<NewExample> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Provider"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<NewExampleProvider>(builder: (context,value,child){
            print("only sllider build");
            return Center(
              child: Slider(
                  min: 0,
                  max: 1,
                  value: value.value,
                  onChanged: (val){
                    value.setChange(val);
                  }),
            );
          }),
          Consumer<NewExampleProvider>(builder: (context,value,child){
            print("and only containers build");
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color:Colors.deepPurpleAccent.withOpacity(value.value),
                    child: Center(child: Text("container 1")),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color:Colors.green.withOpacity(value.value),
                    child: Center(child: Text("container 2")),
                  ),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
