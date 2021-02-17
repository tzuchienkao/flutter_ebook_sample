import 'package:flutter/material.dart';

import 'package:flutter_sample_ch5/sample/drawer_singal_view.dart';

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
    return DrawerSingalView(navList: navList, gridList: gridList);
  }
}
