import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ebook_sample/sample/material_design.dart';

class Person with ChangeNotifier {
  Person({this.counter = 0});

  int counter;

  void increaseCounter() {
    this.counter++;
    notifyListeners();
  }
}

class FlutterSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Person(), child: AppMaterialDesign());
  }
}
