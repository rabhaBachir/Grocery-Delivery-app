import 'package:bottom_bar/bottom_bar.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:grocery_delivery_app/categoryProduct.dart';
import 'package:grocery_delivery_app/checkout.dart';
import 'package:grocery_delivery_app/config/style.dart';
import 'package:grocery_delivery_app/productInfo.dart';
import 'package:grocery_delivery_app/widgets.dart';
import 'categories.dart';
import 'jason.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

int _currentPage = 0;

int j = 0;

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: secondColor,
      body: _currentPage == 0
          ? Container(
              padding: EdgeInsets.only(top: 40, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/profil.jpg"),
                            radius: 25,
                          ),
                          spaseWidth(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              txte("Wolcome", FontWeight.w600, 16, grey),
                              spaseHeight(5),
                              txte("Jenny Dwane", FontWeight.bold, 18, black)
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          notification(Feather.bell),
                          notification(AntDesign.shoppingcart)
                        ],
                      )
                    ],
                  ),
                  spaseHeight(15),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(0),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: width / 1.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.green[200]),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search Product",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[600]),
                                    prefixIcon: Icon(
                                      Feather.search,
                                      color: black,
                                    )),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
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
                        spaseHeight(25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            txte("Categories", FontWeight.bold, 18, black),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Categories()));
                                },
                                child: txte(
                                    "See all", FontWeight.w600, 18, mainColor))
                          ],
                        ),
                        spaseHeight(20),
                        Container(
                          width: width,
                          height: height / 5,
                          child: ListView.builder(
                              itemCount: listcat.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CatProduct(
                                                  catProd: listcat[i],
                                                )));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 15),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              AssetImage(listcat[i].image),
                                          radius: 60,
                                        ),
                                        spaseHeight(15),
                                        txte(listcat[i].name, FontWeight.w600,
                                            18, black)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                        spaseHeight(15), //
                        Container(
                          width: width,
                          height: height / 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/promo.jpg",
                                  fit: BoxFit.fill,
                                ),
                              );
                            },
                            autoplay: true,
                            itemCount: 3,
                            pagination: SwiperPagination(
                              builder: new DotSwiperPaginationBuilder(
                                  color: grey,
                                  activeColor: mainColor,
                                  activeSize: 15),
                            ),
                            //control: SwiperControl(),
                          ),
                        ),
                        spaseHeight(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            txte("Top selling", FontWeight.bold, 18, black),
                            txte("See all", FontWeight.w600, 18, mainColor)
                          ],
                        ),
                        spaseHeight(20),
                        Container(
                          width: width,
                          height: height / 3.5,
                          child: ListView.builder(
                              itemCount: listProduct.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProductInfo(
                                                  product: listProduct[i],
                                                )));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 15),
                                    width: width / 2.5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.grey)),
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  listProduct[i].image,
                                                  fit: BoxFit.fill,
                                                ))),
                                        Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: mainColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                              child: Center(
                                                child: txte(
                                                    listProduct[i]
                                                            .promo
                                                            .toString() +
                                                        "% off",
                                                    FontWeight.w600,
                                                    16,
                                                    secondColor),
                                              ),
                                            )),
                                        Positioned(
                                            bottom: 0,
                                            left: 0,
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: mainColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                              child: Center(
                                                child: txte(
                                                    listProduct[i]
                                                            .prix
                                                            .toString() +
                                                        "£",
                                                    FontWeight.w600,
                                                    16,
                                                    secondColor),
                                              ),
                                            )),
                                        Positioned(
                                            bottom: 10,
                                            right: 10,
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: mainColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                  child: txte(
                                                      listProduct[i].name,
                                                      FontWeight.w600,
                                                      16,
                                                      secondColor)),
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          : _currentPage == 1
              ? listCommend.isEmpty
                  ? Center(
                      child: txte("No items in Shopping Cart", FontWeight.w600,
                          16, mainColor),
                    )
                  : Container(
                      padding: EdgeInsets.only(top: 40, left: 15, right: 15),
                      height: height,
                      width: width,
                      child: Column(
                        children: [
                          pageTitel(context, "Shopping Cart"),
                          spaseHeight(10),
                          Container(
                            width: width - 30,
                            height: height - 350,
                            // color: Colors.amber,
                            child: ListView.builder(
                                padding: EdgeInsets.only(top: 20),
                                itemCount: listCommend.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, i) {
                                  return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[100],
                                      ),
                                      margin: EdgeInsets.only(bottom: 10),
                                      padding: EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.amber),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.asset(
                                                    listCommend[i].image,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              spaseWidth(10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  txte(
                                                      listCommend[i].name,
                                                      FontWeight.bold,
                                                      18,
                                                      black),
                                                  txte("1 kg", FontWeight.w600,
                                                      15, grey),
                                                  txte(
                                                      listCommend[i]
                                                              .prix
                                                              .toString() +
                                                          " £",
                                                      FontWeight.bold,
                                                      15,
                                                      mainColor),
                                                ],
                                              )
                                            ],
                                          ),
                                          Container(
                                            width: 100,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.green[200]),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (listCommend[i].qte >
                                                          0)
                                                        listCommend[i].qte =
                                                            listCommend[i].qte -
                                                                1;
                                                      if (listCommend[i].qte ==
                                                          0)
                                                        total = total -
                                                            listCommend[i].prix;
                                                      listCommend.remove(
                                                          listCommend[i]);
                                                    });
                                                  },
                                                  child: Icon(
                                                    Entypo.minus,
                                                    color: grey,
                                                  ),
                                                ),
                                                txte(
                                                    listCommend[i]
                                                        .qte
                                                        .toString(),
                                                    FontWeight.bold,
                                                    18,
                                                    mainColor),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      listCommend[i].qte =
                                                          listCommend[i].qte +
                                                              1;
                                                    });
                                                  },
                                                  child: Icon(
                                                    Entypo.plus,
                                                    color: grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ));
                                }),
                          ),
                          spaseHeight(15),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[100]),
                            child: TextField(
                              cursorColor: black,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    AntDesign.tag,
                                    color: mainColor,
                                  ),
                                  hintText: "Add your promo code",
                                  border: InputBorder.none),
                            ),
                          ),
                          spaseHeight(15),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[100]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                txte("Total", FontWeight.bold, 18, black),
                                txte(total.toString() + " £", FontWeight.bold,
                                    18, mainColor)
                              ],
                            ),
                          ),
                          spaseHeight(30),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Checkout()));
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: mainColor),
                              child: Center(
                                  child: txte("Proceed to checkout",
                                      FontWeight.w600, 18, secondColor)),
                            ),
                          )
                        ],
                      ),
                    )
              : _currentPage == 2
                  ? listProductFav.isEmpty
                      ? Center(
                          child: txte("No items in favourite list",
                              FontWeight.w600, 16, mainColor),
                        )
                      : Container(
                          padding:
                              EdgeInsets.only(top: 40, left: 15, right: 15),
                          height: height,
                          width: width,
                          child: Column(
                            children: [
                              pageTitel(context, "Favourite"),
                              spaseHeight(10),
                              Expanded(
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisSpacing: 8,
                                              crossAxisSpacing: 8,
                                              crossAxisCount: 2,
                                              childAspectRatio: 2 / 3),
                                      itemCount: listProductFav.length,
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(color: grey)),
                                          child: Stack(
                                            children: [
                                              Positioned.fill(
                                                  child: Image.asset(
                                                      listProductFav[i].image)),
                                              Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        listProductFav.remove(
                                                            listProductFav[i]);
                                                      });
                                                    },
                                                    child: txte(
                                                        "X",
                                                        FontWeight.w300,
                                                        25,
                                                        black),
                                                  )),
                                              Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        color: mainColor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        10))),
                                                    child: Center(
                                                      child: txte(
                                                          listProductFav[i]
                                                                  .promo
                                                                  .toString() +
                                                              "% off",
                                                          FontWeight.w600,
                                                          16,
                                                          secondColor),
                                                    ),
                                                  )),
                                              Positioned(
                                                  bottom: 5,
                                                  right: 5,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ProductInfo()));
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: mainColor),
                                                      child: txte(
                                                          "+",
                                                          FontWeight.bold,
                                                          25,
                                                          Colors.white),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        );
                                      }))
                            ],
                          ),
                        )
                  : _currentPage == 3
                      ? Container(
                          padding:
                              EdgeInsets.only(top: 40, left: 15, right: 15),
                          height: height,
                          width: width,
                          child: Column(
                            children: [
                              pageTitel(context, "Profile"),
                              spaseHeight(10),
                              Expanded(
                                  child: ListView(
                                children: [
                                  Center(
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/profil.jpg"),
                                      radius: 60,
                                    ),
                                  ),
                                  spaseHeight(10),
                                  Center(
                                      child: txte("Jenny Dwane",
                                          FontWeight.bold, 16, grey)),
                                  spaseHeight(40),
                                  infoProfil(AntDesign.inbox, "Order"),
                                  infoProfil(FontAwesome.vcard, "My detailes"),
                                  infoProfil(FontAwesome.credit_card_alt,
                                      "Payement methodes"),
                                  infoProfil(Fontisto.map_marker_alt,
                                      "Delevery address"),
                                  infoProfil(Fontisto.bell_alt, "Notification"),
                                  infoProfil(Foundation.info, "Help"),
                                  infoProfil(
                                      Ionicons.log_in_outline, "Log Out"),
                                ],
                              ))
                            ],
                          ),
                        )
                      : null,
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        onTap: (int index) {
          //_pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text('Home'),
            inactiveColor: grey,
            activeColor: mainColor,
          ),
          BottomBarItem(
            icon: Icon(FontAwesome.shopping_cart),
            title: Text('My cart'),
            inactiveColor: grey,
            activeColor: mainColor, // Optional
          ),
          BottomBarItem(
            icon: Icon(Fontisto.heart),
            title: Text('Favorite'),
            inactiveColor: grey,
            activeColor: mainColor, // Optional
          ),
          BottomBarItem(
            icon: Icon(FontAwesome.user),
            title: Text('Profile'),
            inactiveColor: grey,
            activeColor: mainColor,
          ),
        ],
      ),
    );
  }
}

Widget notification(IconData icn) {
  return Container(
    height: 50,
    width: 50,
    child: Stack(
      children: [
        Positioned.fill(
          child: Icon(
            icn,
            color: grey,
            size: 30,
          ),
        ),
        Positioned(
            top: 5,
            right: 5,
            child: CircleAvatar(
              backgroundColor: mainColor,
              radius: 8,
            ))
      ],
    ),
  );
}

Widget infoProfil(IconData icn, String txt) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icn,
                color: mainColor,
              ),
              spaseWidth(10),
              txte(txt, FontWeight.w600, 16, black)
            ],
          ),
          Icon(
            FontAwesome.angle_right,
            color: black,
          )
        ],
      ),
      spaseHeight(15),
      Container(
        height: 0.5,
        color: Colors.grey[300],
      ),
      spaseHeight(15),
    ],
  );
}
