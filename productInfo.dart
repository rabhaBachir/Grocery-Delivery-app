import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:grocery_delivery_app/config/style.dart';
import 'package:grocery_delivery_app/jason.dart';

class ProductInfo extends StatefulWidget {
  final product;
  const ProductInfo({Key? key, this.product}) : super(key: key);

  @override
  _ProductInfoState createState() => _ProductInfoState();
}

int qte = 1;

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height / 2,
                width: width,
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  child: Image.asset(
                    widget.product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        txte(widget.product.name, FontWeight.bold, 25, black),
                        Container(
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.green[100]),
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (widget.product.qte > 1)
                                      widget.product.qte =
                                          widget.product.qte - 1;
                                  });
                                },
                                child: Icon(
                                  Entypo.minus,
                                  color: grey,
                                ),
                              ),
                              txte(widget.product.qte.toString(),
                                  FontWeight.bold, 18, mainColor),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    widget.product.qte = widget.product.qte + 1;
                                  });
                                },
                                child: Icon(
                                  Entypo.plus,
                                  color: mainColor,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    spaseHeight(15),
                    txte(widget.product.prix.toString() + " £", FontWeight.bold,
                        25, black),
                    spaseHeight(20),
                    txte("Details", FontWeight.w600, 18, mainColor),
                    spaseHeight(15),
                    txte("desc", FontWeight.w600, 15, grey)
                  ],
                ),
              )
            ],
          ),
          Positioned(
              bottom: 15,
              left: 15,
              right: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (listCommend.contains(widget.product) == false)
                          listCommend.add(widget.product);
                      });
                      total = total + widget.product.prix * widget.product.qte;
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: width / 1.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: mainColor),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              AntDesign.shoppingcart,
                              color: secondColor,
                            ),
                            spaseWidth(10),
                            txte(
                                "Add to cart", FontWeight.bold, 18, secondColor)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green[100]),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              widget.product.fav = !widget.product.fav;
                              if (widget.product.fav == true)
                                listProductFav.add(widget.product);
                              else
                                listProductFav.remove(widget.product);
                            });
                          },
                          child: !widget.product.fav
                              ? Icon(
                                  AntDesign.hearto,
                                  color: mainColor,
                                )
                              : Icon(
                                  AntDesign.heart,
                                  color: mainColor,
                                ))),
                ],
              ))
        ],
      ),
    );
  }
}
