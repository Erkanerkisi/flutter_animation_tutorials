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
  Color _color = Colors.blueAccent;
  double _margin = 5.0;
  double _borderRadius = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          /*
          * AnimatedContainer da container özelliklerini değiştirerek anime ettirebiliyoruz.
          * Her render olduğunda propertiesleri değişirse animate ediyor.
          * Curves ise animasyonun geçiş tipini ayarlamamıza olanak tanıyor. Curves. dediğimizde farklı tipleri denemek mümkün.
          * Curves'ler için buraya bakılabilir -> https://api.flutter.dev/flutter/animation/Curves-class.html
          * */
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(_borderRadius),
            ),
            margin: EdgeInsets.all(_margin),
            child: Container(width: 100,height: 100,),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _color = Colors.red;
            _margin = Random().nextDouble() * 100;
            _borderRadius = Random().nextDouble() * 100;
          });
        },
      ),
    );
  }
}
