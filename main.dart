import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/config/style.dart';
import 'package:grocery_delivery_app/umpording2.dart';
import 'package:grocery_delivery_app/widgets.dart';

void main() {
  runApp(MyApp());
}

@override
initState() {}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            "assets/1.png",
          )),
          Positioned(
              bottom: 10,
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Umpording2()));
                  },
                  child: next(
                    context,
                  ))),
        ],
      ),
    );
  }
}
