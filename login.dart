import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:grocery_delivery_app/config/style.dart';
import 'package:grocery_delivery_app/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

int selected = 1;
bool enable = true;
bool _checkbox = false;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      //backgroundColor: Colors.amber,
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            /* Positioned.fill(
                child: Container(
              height: height,
              width: width,
              color: Colors.amber,
            )),*/
            Positioned(
                child: Container(
                    width: width,
                    height: height / 2.5,
                    child: Image.asset(
                      "assets/4.png",
                      fit: BoxFit.fill,
                    ))),
            Positioned(
                top: height / 3.5,
                left: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: secondColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: grey,
                        blurRadius: 25.0,
                        spreadRadius: 5.0,
                        offset: Offset(
                          5.0,
                          5.0,
                        ),
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [choose("Sign in", 1), choose("Sign up", 2)],
                      ),
                      spaseHeight(20),
                      selected == 1
                          ? Column(
                              children: [
                                userInfo("Username", Feather.user),
                                spaseHeight(25),
                                passWord(),
                                spaseHeight(25),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          activeColor: mainColor,
                                          value: _checkbox,
                                          onChanged: (value) {
                                            setState(() {
                                              _checkbox = !_checkbox;
                                            });
                                          },
                                        ),
                                        txte("Remember me ", FontWeight.w600,
                                            16, grey)
                                      ],
                                    ),
                                    txte("Forgot password", FontWeight.w600, 16,
                                        mainColor)
                                  ],
                                ),
                                spaseHeight(20),
                                Center(
                                  child: txte("Or", FontWeight.w600, 18, grey),
                                ),
                                spaseHeight(25),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Feather.twitter,
                                      color: grey,
                                    ),
                                    Icon(
                                      Feather.facebook,
                                      color: grey,
                                    ),
                                    Icon(
                                      Feather.mail,
                                      color: grey,
                                    ),
                                  ],
                                ),
                                spaseHeight(15),
                              ],
                            )
                          : Column(
                              children: [
                                userInfo("Name", Feather.user),
                                spaseHeight(25),
                                userInfo("Email", Feather.mail),
                                spaseHeight(25),
                                userInfo("Phone Number", Feather.phone),
                                spaseHeight(25),
                                passWord(),
                                spaseHeight(25),
                                Row(
                                  children: [
                                    Checkbox(
                                      activeColor: mainColor,
                                      value: _checkbox,
                                      onChanged: (value) {
                                        setState(() {
                                          _checkbox = !_checkbox;
                                        });
                                      },
                                    ),
                                    txte("Remember me ", FontWeight.w600, 16,
                                        grey)
                                  ],
                                ),
                              ],
                            )
                    ],
                  ),
                )),
            Positioned(
                bottom: 30,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Container(
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 45, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: mainColor),
                          child: Center(
                            child:
                                txte("Login", FontWeight.bold, 18, secondColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget choose(String txt, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Column(
        children: [
          txte(txt, selected == index ? FontWeight.bold : FontWeight.w600, 22,
              selected == index ? black : grey),
          spaseHeight(5),
          if (selected == index)
            Container(
              width: 60,
              height: 2,
              color: mainColor,
            )
        ],
      ),
    );
  }

  Widget userInfo(String txt, IconData icn) {
    return TextField(
      cursorColor: black,
      decoration: InputDecoration(
        hintText: txt,
        hintStyle: TextStyle(color: grey),
        prefixIcon: Icon(
          icn,
          color: grey,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: mainColor),
        ),
      ),
    );
  }

  Widget passWord() {
    return TextField(
      cursorColor: black,
      obscureText: enable,
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(color: grey),
        prefixIcon: Icon(
          Feather.lock,
          color: grey,
        ),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              enable = !enable;
            });
          },
          child: Icon(
            enable ? Feather.eye_off : Feather.eye,
            color: grey,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: mainColor),
        ),
      ),
    );
  }
}
