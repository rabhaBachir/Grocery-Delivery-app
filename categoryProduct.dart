import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:grocery_delivery_app/classes/category.dart';
import 'package:grocery_delivery_app/jason.dart';

import 'config/style.dart';

class CatProduct extends StatefulWidget {
  final catProd;
  const CatProduct({Key? key, this.catProd}) : super(key: key);

  @override
  _CatProductState createState() => _CatProductState();
}

class _CatProductState extends State<CatProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Feather.arrow_left,
                    color: grey,
                  ),
                ),
                txte(widget.catProd.name, FontWeight.bold, 20, black),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green[200]),
                  child: Icon(
                    Feather.sliders,
                    color: mainColor,
                  ),
                )
              ],
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3),
                  itemCount: listProduct.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: grey)),
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              listProduct[i].image,
                              fit: BoxFit.fill,
                            ),
                          )),
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                child: Center(
                                  child: txte(
                                      listProduct[i].promo.toString() + "% off",
                                      FontWeight.w600,
                                      16,
                                      secondColor),
                                ),
                              )),
                          Positioned(
                              top: 5,
                              right: 5,
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      listProduct[i].fav = !listProduct[i].fav;
                                      if (listProduct[i].fav == true)
                                        listProductFav.add(listProduct[i]);
                                      else
                                        listProductFav.remove(listProduct[i]);
                                    });
                                  },
                                  child: !listProduct[i].fav
                                      ? Icon(
                                          AntDesign.hearto,
                                          color: mainColor,
                                        )
                                      : Icon(
                                          AntDesign.heart,
                                          color: mainColor,
                                        ))),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  txte(listProduct[i].name, FontWeight.bold, 18,
                                      Colors.white),
                                  txte(listProduct[i].prix.toString() + " £",
                                      FontWeight.bold, 18, Colors.white),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 5,
                              right: 5,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: mainColor),
                                child: Center(
                                  child: Icon(
                                    Entypo.plus,
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
