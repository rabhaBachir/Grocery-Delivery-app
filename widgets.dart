// next botton

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'config/style.dart';

// double width = MediaQuery.of(context).size.width;
// double height = MediaQuery.of(context).size.height;
Widget pageTitel(BuildContext context, String txt) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(),
      /* InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Feather.arrow_left,
          color: grey,
        ),
      ),*/
      txte(txt, FontWeight.bold, 20, black),
      Container()
    ],
  );
}

Widget next(
  BuildContext context,
) {
  return /*InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => fnc()));
      },
      child:*/
      Container(
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 4,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: mainColor),
          child: Center(child: txte("Next", FontWeight.w600, 18, secondColor)),
        ),
      ],
    ),
  );
}
