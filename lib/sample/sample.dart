import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ebook_sample/sample/drawer.dart';
import 'package:flutter_ebook_sample/sample/bottom_nav.dart';
import 'package:flutter_ebook_sample/sample/future.dart';

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
      create: (_) => Person(),
      child: MaterialApp(
        title: 'Flutter Sample',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => AppLayout(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Provider.of<Person>(context).counter != 0
              ? Text('Count: ${Provider.of<Person>(context).counter}',
                  style: TextStyle(color: Colors.white))
              : Text('Flutter Sample', style: TextStyle(color: Colors.white)),
          leading: DrawerLeading(),
        ),
        drawer: AppDrawer(),
        body: Center(child: AppAsync()),
        floatingActionButton: AppDialog(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AppBottomNav());
  }
}
