

import 'package:flutter/material.dart';

class AdminPageWidget extends StatelessWidget {

  String image;
  String title;
  String subtitle;
  String time;
  String rate;
  String price;

  AdminPageWidget({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.rate,
    required this.price,
});



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Row(
        children: [
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                    this.image))),
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.subtitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "Torta de Chocolate y nueces con manjar acompañado de frutas de estacion",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xffED9B00),
                        size: 16.0,
                      ),
                      Text(
                        this.rate,
                        style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Icon(
                        Icons.timer,
                        color: Colors.white60,
                        size: 16.0,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "S/${this.price}",
                        style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0),
                      ),
                    ],
                  )
                ],
              )),
          Text(
            "S/ 10.00",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}