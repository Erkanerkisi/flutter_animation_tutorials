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

  Widget myWidget = Container(
    width: 100,
    height: 100,
    color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          /*
          * iki widget arasında geçiş için kullanılır. defaultunda fade transition kullanılıyor.
          * Fakat bu transition'ı transitionBuilder'ı override ederek değiştirebiliyoruz.
          *
          * */
          child: AnimatedSwitcher(
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                child: child,
                scale: animation,
              );
            },
            duration: Duration(milliseconds: 1000),
            child: myWidget,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            myWidget = Icon(
              Icons.favorite,
              size: 60,
              color: Colors.green,
            );
          });
        },
      ),
    );
  }
}
