import 'package:flutter/material.dart';

class AppBottomNav extends StatefulWidget {
  @override
  _AppBottomNavState createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                Icons.toggle_off,
                color: Colors.grey[800],
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.toggle_on,
                color: Colors.grey[800],
              ),
              onPressed: () {}),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }
}
