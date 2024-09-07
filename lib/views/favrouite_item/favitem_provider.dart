import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagment_series/provider/fav_item_provider.dart';
import 'package:provider_statemanagment_series/views/favrouite_item/my_fav_item_screen.dart';

class FavrouiteItemProvider extends StatefulWidget {
  const FavrouiteItemProvider({super.key});

  @override
  State<FavrouiteItemProvider> createState() => _FavrouiteItemProviderState();
}

class _FavrouiteItemProviderState extends State<FavrouiteItemProvider> {

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text("Favrouite Item Provider"),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFavItemScreen()));
              },
              child: Padding(
                padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width*.04),
                child: Icon(Icons.favorite),
              ))
        ],

      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: 100,
                    itemBuilder: (context,index){
                      return Consumer<FavItemProvider>(builder: (context,value,child){
                        return ListTile(
                          onTap: (){
                            if(value.selectedItem.contains(index)){
                              value.removeItem(index);
                            }else{
                              value.addItem(index);
                            }
                          },
                          title: Text("item "+index.toString()),
                          trailing: Icon(
                             value.selectedItem.contains(index)?Icons.favorite:Icons.favorite_outline,
                          ),
                        );
                      });
                    }),
            )
          ],
        ),
      ),
    );
  }
}
