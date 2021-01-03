import 'package:animated_stream_list/animated_stream_list.dart';
import 'package:flutter/material.dart';

import 'data_bloc.dart';
import 'row_title.dart';


class MyApp extends StatelessWidget {
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
  int _counter = 0;
  DataBloc dataBloc;

  void _incrementCounter() {
    dataBloc.add(RowTitle(name: "Erkan Row Title"));
  }

  @override
  void initState() {
    dataBloc = DataBloc();
  }


  Widget _itemBuilder(RowTitle rt, int index, BuildContext context,
      Animation<double> animation) {
    // here is the animation that you put.
    return FadeTransition(
      opacity: animation,
      child: Card(
        child: ListTile(
          title: Text(rt.name),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedStreamList(
          streamList: dataBloc.data,
          itemBuilder: _itemBuilder,
          itemRemovedBuilder: _itemBuilder,//You have to change here. I put it temporarly
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
