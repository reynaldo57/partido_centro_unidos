
import 'package:flutter/material.dart';
import 'package:partido_centro_unidos/common/colors.dart';
import 'package:partido_centro_unidos/widgets/text_normal_widget.dart';


class AdminWidget extends StatelessWidget {

  bool primary;
  String text;
  Widget goTo;

  AdminWidget({
    required this.primary,
    required this.text,
    required this.goTo,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      child: FilterChip(
        backgroundColor: primary ? BRAND_PRIMARY : COLOR_FONT_PRIMARY,
        elevation: 0,
        shadowColor: Colors.transparent,
        side: BorderSide(width: 1, color: Colors.white),
        shape: StadiumBorder(side: BorderSide(style: BorderStyle.none)),
        label: Container(
          height: 26.0,
          child: Center(
            child: TextNormalPrimary(
              text: this.text,
            ),
          ),
        ),
        onSelected: (bool selected) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => this.goTo),
          );

        },
      ),
    );
  }
}