import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ebook_sample/sample/drawer.dart';
import 'package:flutter_ebook_sample/sample/bottom_nav.dart';
import 'package:flutter_ebook_sample/sample/future.dart';
import 'package:flutter_ebook_sample/sample/sample.dart' show Person;

final List<Tab> appTabs = <Tab>[
  Tab(text: 'Tab1', icon: Icon(Icons.swap_horiz)),
  Tab(text: 'Tab2', icon: Icon(Icons.swap_vert)),
  Tab(text: 'Tab3', icon: Icon(Icons.swap_calls)),
];

class AppMaterialDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sample',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: '/',
      home: DefaultPage(),
      // routes: {
      //   '/': (context) => DefaultPage(),
      // },
      debugShowCheckedModeBanner: false,
    );
  }
}

class DefaultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: appTabs.length,
        child: Scaffold(
            appBar: AppBar(
              title: Provider.of<Person>(context).counter != 0
                  ? Text('Count: ${Provider.of<Person>(context).counter}',
                      style: TextStyle(color: Colors.white))
                  : Text('Flutter Sample',
                      style: TextStyle(color: Colors.white)),
              leading: DrawerLeading(),
              bottom: TabBar(
                isScrollable: true,
                tabs: appTabs,
              ),
            ),
            drawer: AppDrawer(),
            body: WillPopScope(
                child: Center(child: AppAsync()),
                onWillPop: () async =>
                    showDialog(
                        context: context,
                        builder: (context) =>
                            AlertDialog(title: Text('Are you sure you want to quit?'), actions: <Widget>[
                              RaisedButton(
                                  child: Text('sure'),
                                  onPressed: () => Navigator.of(context).pop(true)),
                              RaisedButton(
                                  child: Text('cancel'),
                                  onPressed: () => Navigator.of(context).pop(false)),
                            ])
                    )),
            floatingActionButton: AppDialog(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AppBottomNav()));
  }
}

