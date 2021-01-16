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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ScaleTransition(
          scale: Tween(begin: 15.0, end: 21.0).animate(_animationController),
          child: GestureDetector(
            onTap: (){
              !isLiked ? doLike() : doUnlike();
            },
            child: Icon(
              Icons.favorite,
              color: isLiked ? Colors.red : Colors.black,
              size: 5,
            ),
          ),
        ),
      ),
    );
  }

  doLike(){
    setState(() {
      isLiked = true;
    });
    _animationController.forward();
  }
  doUnlike(){
    setState(() {
      isLiked = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _animationController..addStatusListener((status) {
      if(status == AnimationStatus.completed)
        _animationController.reverse();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
