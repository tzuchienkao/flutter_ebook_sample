import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sample_ch5/sample/bottom_nav.dart';
import 'package:flutter_sample_ch5/sample/future.dart';

class AppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Person(name: "Yohan", age: 25),
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sample',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Provider.of<Person>(context).age != null
              ? Text('${Provider.of<Person>(context).age}')
              : Text('Flutter Sample'),
        ),
        body: Center(
          child: Text(
            '''
          Hi ${context.select((Person p) => p.name)}!
          You are ${Provider.of<Person>(context).age} years old''',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Provider.of<Person>(context, listen: false).increaseAge(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AppBottomNav());
  }
}
