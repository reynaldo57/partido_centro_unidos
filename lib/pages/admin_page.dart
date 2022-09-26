import 'package:flutter/material.dart';
import 'package:partido_centro_unidos/widgets/admin_page_widget.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B1A21),
      appBar: AppBar(
        title: Text(
          "Postres",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [AdminPageWidget(
                image: "https://comidasperuanas.net/wp-content/uploads/2020/12/Torta-Dona-Pepa.jpg",
                title: "lOPES aLIAGA",
                subtitle: "Keiko Fujimori",
                time: "45Años",
                rate: "985647845",
                price: "456"
            )],
          ),
        ),
      ),
    );
  }
}
