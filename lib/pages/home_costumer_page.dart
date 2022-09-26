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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ComiteEjecutivoWidget(
                          image: "https://radiosantarosa.com.pe/wp-content/uploads/2020/10/WhatsApp-Image-2020-10-22-at-2.49.51-PM.jpeg",
                          title: "Gerwer Campero",
                          subtitle: "Medico Cirujano",
                          price: "45 Años",
                          rate: "965876459",
                          goTo: ProductDetailPage(),
                      ),

                    ],
                  ),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10.0, right: 14.0),
                          constraints: BoxConstraints(maxWidth: 200.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 140.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    18.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 10,
                                      color: Colors.black12.withOpacity(
                                        0.04,
                                      ),
                                    ),
                                  ],
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://radiosantarosa.com.pe/wp-content/uploads/2020/10/WhatsApp-Image-2020-10-22-at-2.49.51-PM.jpeg"
                                    ),
                                ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              H1(text: "Gerwer Campero"),
                              SizedBox(
                                height: 4,
                              ),
                              H2(text: "Abogado"),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  H2(text: "47 Años"),
                                  Container(
                                    child: Row(
                                      children: [
                                        H2(text: "956987231"),
                                        Icon(
                                          Icons.phone,
                                          size: 18.0,
                                          color: Color(0xffED9B00),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10.0, right: 14.0),
                        constraints: BoxConstraints(maxWidth: 200.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 140.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  18.0,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 10,
                                    color: Colors.black12.withOpacity(
                                      0.04,
                                    ),
                                  ),
                                ],
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://portal.andina.pe/EDPfotografia3/Thumbnail/2020/11/03/000723678W.jpg"),
                                ),
                              ),
                              // child: Stack(
                              //   children: [
                              //     Positioned(
                              //       right: 0,
                              //       child: Container(
                              //         margin: EdgeInsets.symmetric(
                              //             horizontal: 10.0, vertical: 4),
                              //         padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                              //         decoration: BoxDecoration(
                              //             color: Color(0xffED9B00),
                              //             borderRadius: BorderRadius.circular(26.0)
                              //         ),
                              //         child: Text(
                              //           "-30% Desc",
                              //           style: TextStyle(
                              //             fontSize: 15.0,
                              //             fontWeight: FontWeight.bold,
                              //           ),
                              //         ),
                              //       ),
                              //     )
                              //   ],
                              // ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            H1(text: "Puno"),
                            SizedBox(
                              height: 4,
                            ),
                            H2(text: "Alejandro Tipula"),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                H2(text: "45 Años"),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        size: H2_SIZE,
                                        color: BRAND_PRIMARY
                                      ),
                                      H2(text: "9875632189"),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
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