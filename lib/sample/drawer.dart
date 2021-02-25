import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ebook_sample/sample/sample.dart' show Person;
import 'package:flutter_ebook_sample/sample/stream_builder.dart';
// import 'package:flutter_ebook_sample/sample/drawer_singal_view.dart';

class DrawerLeading extends StatefulWidget {
  @override
  _DrawerLeadingState createState() => _DrawerLeadingState();
}

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _DrawerLeadingState extends State<DrawerLeading> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.format_indent_decrease,
        color: Colors.white,
      ),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}

class _AppDrawerState extends State<AppDrawer> {
  final List<Map<String, dynamic>> navList = [
    {'label': 'Home', 'icon': Icons.home},
    {'label': 'Settings', 'icon': Icons.settings}
  ];
  final List<String> gridList = ['A', 'B', 'C', 'D', 'E'];

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: Provider.of<Person>(context).counter != 0
          ? [
              UserAccountsDrawerHeader(
                accountName: Text('Agnes'),
                accountEmail: Text('oyan114@gmail.com'),
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.orange),
                      child: Padding(
                        padding: EdgeInsets.all(0),
                      )),
                ),
              )
            ]
          : [
              ListTile(
                title: Text('Drawer'),
              ),
              AppStreamAsync(),
            ],
    ));
    // return DrawerSingalView(navList: navList, gridList: gridList);
  }
}
