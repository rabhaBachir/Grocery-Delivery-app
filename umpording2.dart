import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/umpording3.dart';
import 'package:grocery_delivery_app/widgets.dart';

class Umpording2 extends StatefulWidget {
  const Umpording2({Key? key}) : super(key: key);

  @override
  _Umpording2State createState() => _Umpording2State();
}

class _Umpording2State extends State<Umpording2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            "assets/2.png",
          )),
          Positioned(
              bottom: 10,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Umpording3()));
                },
                child: next(
                  context,
                ),
              )),
        ],
      ),
    );
  }
}
