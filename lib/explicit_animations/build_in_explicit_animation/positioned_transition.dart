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
      body: Stack(
        children: [
          PositionedTransition(
            rect: _animation,
            child: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = RelativeRectTween(
            begin: RelativeRect.fromLTRB(10.0, 40.0, 10.0, 40.0),
            end: RelativeRect.fromLTRB(200.0, 300.0, 200.0, 300.0))
        .animate(_animationController)..addStatusListener((status) {
          if(status == AnimationStatus.completed)
            _animationController.reverse();
          else if (status == AnimationStatus.dismissed)
            _animationController.forward();
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
  }
}
