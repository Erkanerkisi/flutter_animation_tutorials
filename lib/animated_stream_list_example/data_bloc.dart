import 'dart:async';

import 'row_title.dart';

class DataBloc {
  List<RowTitle> titleList = List();
  final StreamController<List<RowTitle>> streamController = StreamController();
  Stream get data => streamController.stream;

  void add(RowTitle title) {
    titleList.add(title);
    streamController.add(titleList);
  }

  void close() {
    streamController.close();
  }
}
