import 'package:flutter/material.dart';

class ValueNotifyListnerScreen extends StatelessWidget {
   ValueNotifyListnerScreen({super.key});

   ValueNotifier<int> _count=ValueNotifier<int>(0);
   ValueNotifier<bool> toggle=ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateLess As Statefull Widget'),
        centerTitle: true,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            ValueListenableBuilder(
                valueListenable: toggle,
                builder: (context,value,child){
                  return TextFormField(
                    obscureText: toggle.value,
                    decoration: InputDecoration(
                        hintText: 'enter password',
                        prefixIcon: const Icon(Icons.key),
                        suffixIcon: InkWell(
                            onTap: (){
                              toggle.value=!toggle.value;
                            },
                            child: Icon(toggle.value?Icons.visibility_off_outlined:Icons.visibility_outlined)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )

                    ),

                  );
                }),

            ValueListenableBuilder(
                valueListenable: _count,
                builder: (context,value,child){
                  print('from here build');
                  return Center(child: Text(_count.value.toString(),style: const TextStyle(fontSize: 30),),);
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _count.value++;
        },
        child:const Center(child: Icon(Icons.add)),

      ),
    );
  }
}
