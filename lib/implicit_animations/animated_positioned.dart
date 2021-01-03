import 'dart:math';

import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  double _w = 50;
  bool _messageVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            width: 70,
            left: 195,
            height: 50,
            top: 130,
            child: Text(
              "Erkan",
              style: TextStyle(fontSize: 18),
            ),
          ),
          /*
          * AnimatedPositioned child widget'ın yüksekliğini, genişliğini ve pozisyonunu değiştirebildiğin animeted widgettır
          * width ve height parametreleri şeklini, top buttom left right ise pozisyonunu belirler.
          * Stack içinde kullanmak gerekli sanırım.
          * */
          AnimatedPositioned(
              width: _w,
              height: _messageVisible ? 75 : 60,
              top: _messageVisible ? 50 : 100,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              child: Icon(
                Icons.favorite,
                size: 80,
                color: Colors.red,
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _messageVisible = !_messageVisible;
          });
        },
      ),
    );
  }
}
