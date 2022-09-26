

import 'package:flutter/material.dart';
import 'package:partido_centro_unidos/pages/home_costumer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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