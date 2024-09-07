import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/fav_item_provider.dart';

class MyFavItemScreen extends StatefulWidget {
  const MyFavItemScreen({super.key});

  @override
  State<MyFavItemScreen> createState() => _MyFavItemScreenState();
}

class _MyFavItemScreenState extends State<MyFavItemScreen> {
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<FavItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favrouite Item Screen"),
        centerTitle: true,

      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: provider.selectedItem.length,
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
                          value.selectedItem.contains(index)?Icons.favorite_outline:Icons.favorite,
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
