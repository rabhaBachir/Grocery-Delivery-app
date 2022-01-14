import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:grocery_delivery_app/config/style.dart';
import 'package:grocery_delivery_app/home.dart';
import 'package:grocery_delivery_app/widgets.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

DateTime _selectedValue = DateTime.now();
bool _checkbox = false;
bool _checkbox2 = false;
int selected = 0;
int selected2 = 0;

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: secondColor,
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 15, right: 15),
        child: Column(
          children: [
            pageTitel(context, "Checkout"),
            spaseHeight(20),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            txte(
                                "Delevery Address", FontWeight.w600, 16, black),
                            txte("Change", FontWeight.w600, 16, mainColor),
                          ],
                        ),
                        spaseHeight(10),
                        txte("350 St california,America", FontWeight.w600, 14,
                            grey),
                        spaseHeight(10),
                        txte("Mobile: 002130554789966", FontWeight.w600, 14,
                            grey)
                      ],
                    ),
                  ),
                  spaseHeight(25),
                  txte("Delevery Date", FontWeight.w600, 16, black),
                  spaseHeight(10),
                  DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: mainColor,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        _selectedValue = date;
                      });
                    },
                  ),
                  spaseHeight(25),
                  txte("Delevery Methode", FontWeight.w600, 16, black),
                  spaseHeight(10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                    child: Column(
                      children: [
                        delevry("Door Delevery", 1),
                        spaseHeight(15),
                        Container(
                          height: 1,
                          color: grey,
                        ),
                        spaseHeight(15),
                        delevry("Pick Up ", 2),
                      ],
                    ),
                  ),
                  spaseHeight(25),
                  txte("Payment", FontWeight.w600, 16, black),
                  spaseHeight(10),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                    child: Column(
                      children: [
                        payment("Card Visa", Entypo.credit_card, 1),
                        spaseHeight(10),
                        payment("Wallet", Entypo.wallet, 2),
                        spaseHeight(10),
                        payment("Cach", FontAwesome.money, 3),
                      ],
                    ),
                  ),
                  spaseHeight(35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          txte("Total :", FontWeight.bold, 16, grey),
                          spaseHeight(10),
                          txte("180 £", FontWeight.bold, 18, mainColor)
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                // title: Text("Alert Dialog"),
                                content: Image.asset("assets/dialog.png"),
                                actions: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          // _currentPage = 0;
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Home()));
                                      },
                                      child: Center(child: botton("Go Back"))),
                                ],
                              );
                            },
                          );
                        },
                        child: botton("Placed Order"),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget payment(String txt, IconData icn, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Row(
        children: [
          Icon(
            icn,
            color: selected == index ? mainColor : grey,
          ),
          spaseWidth(10),
          txte(txt, FontWeight.w600, 15, black)
        ],
      ),
    );
  }

  Widget delevry(String txt, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selected2 = index;
        });
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: grey,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: selected2 == index ? mainColor : grey,
            ),
          ),
          spaseWidth(10),
          txte(txt, FontWeight.w600, 16, black)
        ],
      ),
    );
  }

  Widget botton(String txt) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: mainColor),
      child: Center(
        child: txte(txt, FontWeight.bold, 15, Colors.white),
      ),
    );
  }
}
