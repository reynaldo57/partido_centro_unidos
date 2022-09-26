

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:partido_centro_unidos/pages/home_costumer_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

            primarySwatch: Colors.blue,
            fontFamily: 'Source Sans Pro Regular'
        ),
        home: HomeCustomerPage()
    );
  }
}