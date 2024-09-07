import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagment_series/provider/count_provider.dart';
import 'package:provider_statemanagment_series/provider/fav_item_provider.dart';
import 'package:provider_statemanagment_series/provider/logedin_provider.dart';
import 'package:provider_statemanagment_series/provider/login_provider.dart';
import 'package:provider_statemanagment_series/provider/new_example_provider.dart';
import 'package:provider_statemanagment_series/provider/theme_change.dart';
import 'package:provider_statemanagment_series/views/favrouite_item/favitem_provider.dart';
import 'package:provider_statemanagment_series/views/login_api_provider.dart';
import 'package:provider_statemanagment_series/views/new_example.dart';
import 'package:provider_statemanagment_series/views/screen_two.dart';
import 'package:provider_statemanagment_series/views/theme_changer.dart';
import 'package:provider_statemanagment_series/views/value_notify_listner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>CountProvider()),
          ChangeNotifierProvider(create: (_)=>NewExampleProvider()),
          ChangeNotifierProvider(create: (_)=>FavItemProvider()),
          ChangeNotifierProvider(create: (_)=>ThemeChanger()),
          ChangeNotifierProvider(create: (_)=>AuthProvider()),
          ChangeNotifierProvider(create: (_)=>AuthProviders()),
        ],
    child:Builder(builder: (BuildContext context){
      final themeProvider=Provider.of<ThemeChanger>(context);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode:themeProvider.themeMode,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            color: Colors.purple,
          )
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
            color: Colors.grey.shade900,
          )
        ),
        home:LogInScreen(),
      );
    })
    );
  }
}
