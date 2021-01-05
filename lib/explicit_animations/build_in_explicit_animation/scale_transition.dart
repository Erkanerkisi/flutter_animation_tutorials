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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
            /*
          *
          * Build in explicit animasyonlarda istene animation alanına controller verilebilir
          * veya kendi belirlediğimiz bir Tween verilebilir ve bir contcroller a bağlanabilir
          * Aşağıda scale kısmına Tween vererek biraz daha büyük hale getirdim. fakat sadece _controller da verilebilir.
          * controller verilirse default  0-1 tween vermekte.
          *
          * */
            child: ScaleTransition(
          alignment: Alignment.center,
          scale: Tween(begin: 1.0, end: 5.0).animate(_animationController),
          child: Text("Erkan Dön Bebeğim"),
        )),
      ),
    );
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
  }
}
