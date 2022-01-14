import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/login.dart';
import 'package:grocery_delivery_app/widgets.dart';

class Umpording3 extends StatefulWidget {
  const Umpording3({Key? key}) : super(key: key);

  @override
  _Umpording3State createState() => _Umpording3State();
}

class _Umpording3State extends State<Umpording3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            "assets/3.png",
          )),
          Positioned(
              bottom: 10,
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: next(context))),
        ],
      ),
    );
  }
}
