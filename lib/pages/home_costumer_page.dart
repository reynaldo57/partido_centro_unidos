import 'dart:math';

import 'package:flutter/material.dart';
import 'package:partido_centro_unidos/common/colors.dart';
import 'package:partido_centro_unidos/common/typography.dart';
import 'package:partido_centro_unidos/pages/product_detail_page.dart';
import 'package:partido_centro_unidos/pages/admin_page.dart';
import 'package:partido_centro_unidos/services/firebase_service.dart';
import 'package:partido_centro_unidos/widgets/admin_widget.dart';
import 'package:partido_centro_unidos/widgets/comite_ejecutivo_widget.dart';
import 'package:partido_centro_unidos/widgets/text_normal_widget.dart';



class HomeCustomerPage extends StatelessWidget {

  FirestoreService _administratorsFirestoreService = new FirestoreService(collection: "administrators");
  FirestoreService _contentsFirestoreService = new FirestoreService(collection: 'contents');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1B1A21),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //header
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.red,
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                          AssetImage("assets/images/pcu3.png"),
                        ),

                      ),

                      SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          H1(text: "Partido Centro UNIDOS"),
                          H2(text: "ideologia Republicana")

                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      IconButton(
                        onPressed: () {
                          // FirestoreService _firestoreService = new FirestoreService();
                          // _firestoreService.getAdministrators();
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                //categories
                FutureBuilder(
                  future: _administratorsFirestoreService.getAdministrators(),
                  builder: (BuildContext, AsyncSnapshot snap){
                    if(snap.hasData){
                      List<Map<String, dynamic>> administrators = snap.data;
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: administrators.map<Widget>(
                                (e) => AdminWidget(
                                  text: e["description"],
                                  primary: e["order"],
                                  goTo: AdminPage(), // AQUI VA EL ADMIN PAGE
                                ),
                            ).toList(),
                          ),
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator(),);
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                //Promotions

                Container(

                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Text(
                        "Comite Ejecutivo",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontFamily: 'Source Sans Pro Black'),
                      )
                    ],
                  ),
                ),
                FutureBuilder(
                  future: _contentsFirestoreService.getContents(categooryId: "jdSej1WyRKsiFItGRKo9"),
                  builder: (BuildContext context, AsyncSnapshot snap){
                    if(snap.hasData){
                      List<Map<String, dynamic>> contents = snap.data;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: contents.map<Widget>((e) => ComiteEjecutivoWidget(
                              image: e["image"],
                              title: e["name"],
                              subtitle: e["description"],
                              price: e["cel"].toString(),
                              rate: e["wp"].toString(),
                              goTo: ProductDetailPage(),
                          ),
                          ).toList(),
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator(),);
                  },
                ),

                SizedBox(
                  height: 40,
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      H1(text: "Comites Regionales")
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FutureBuilder(
                  future: _contentsFirestoreService.getContents(categooryId: "9KNzH8Bv2ZenxmqlQiXZ"),
                  builder: (BuildContext context, AsyncSnapshot snap){
                    if(snap.hasData){
                      List<Map<String, dynamic>> contents = snap.data;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: contents.map<Widget>((e) => ComiteEjecutivoWidget(
                            image: e["image"],
                            title: e["name"],
                            subtitle: e["description"],
                            price: e["cel"].toString(),
                            rate: e["wp"].toString(),
                            goTo: ProductDetailPage(),
                          ),
                          ).toList(),
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator(),);
                  },
                ),
                //section 2
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      H1(text: "Contactos - Ubicacion")
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FutureBuilder(
                  future: _contentsFirestoreService.getContents(categooryId: "wwB53gc64jtOOSXGhtjS"),
                  builder: (BuildContext context, AsyncSnapshot snap){
                    if(snap.hasData){
                      List<Map<String, dynamic>> contents = snap.data;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: contents.map<Widget>((e) => ComiteEjecutivoWidget(
                            image: e["image"],
                            title: e["name"],
                            subtitle: e["description"],
                            price: e["cel"].toString(),
                            rate: e["wp"].toString(),
                            goTo: ProductDetailPage(),
                          ),
                          ).toList(),
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator(),);
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
        ));
  }
}