import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:grocery_delivery_app/config/style.dart';
import 'package:grocery_delivery_app/jason.dart';
import 'package:grocery_delivery_app/widgets.dart';

import 'categoryProduct.dart';
import 'classes/category.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    Category cat;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.only(top: 30, right: 15, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pageTitel(context, "Categories"),
            spaseHeight(35),
            Wrap(
              children: [
                for (int i = 0; i < listcat.length; i++)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CatProduct(catProd: listcat[i])));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30, right: 30),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(listcat[i].image),
                            radius: 45,
                          ),
                          spaseHeight(15),
                          txte(listcat[i].name, FontWeight.w600, 18, black)
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
