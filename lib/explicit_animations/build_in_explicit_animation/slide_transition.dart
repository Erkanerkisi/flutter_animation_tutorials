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
  AnimationController _animationController;
  Animation _animation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            /*
            *
            * Direk controller verilemiyor. animasyon<offset> oluşturup vermek gerekiyor.
            * verdiğin offsete göre de slide ediyor.
            *
            * */
              child: SlideTransition(
            textDirection: TextDirection.ltr,
            position: _animation,
            child: Text("Erkan GOOOOOOOOOOOOOOOOOOOOL"),
          )),
        ],
      ),
    );
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 7))
          ..repeat();
    _animation = Tween(begin: Offset(-1,0),end: Offset(4,0)).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
  }
}
