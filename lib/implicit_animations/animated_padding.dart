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
  EdgeInsets _padding = EdgeInsets.all(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          /*
          * AnimatedPadding herhangi bir child objesine padding animasyonu sağlıyor
          * Implicit animasyonlardan bir tanesidir.
          * onEnd fonksiyonu ile, bir callback function tetikleyebiliyoruz.
          *
          * */
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Container(
              width: 50,
              height: 50,
              color: Colors.blueAccent,
            ),
              AnimatedPadding(
                padding: _padding,
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeIn,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),Container(
                width: 50,
                height: 50,
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _padding = EdgeInsets.all(Random().nextDouble()* 100);
          });
        },
      ),
    );
  }
}
