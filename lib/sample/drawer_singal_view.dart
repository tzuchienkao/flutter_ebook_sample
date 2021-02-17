import 'package:flutter/material.dart';

class DrawerSingalView extends StatelessWidget {
  final navList;
  final gridList;
  DrawerSingalView({Key key, this.navList, this.gridList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          height: 800.0,
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints:
                              BoxConstraints(minHeight: 50.0, minWidth: 50.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.orange),
                                child: Padding(
                                  padding: EdgeInsets.all(0),
                                )),
                          ),
                        ),
                        Text('This is the Drawer')
                      ]),
                ),
              ),
              Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: gridList.length,
                      itemBuilder: (BuildContext context, int idx) {
                        return Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              gridList[idx],
                            ));
                      })),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: navList.length,
                      itemBuilder: (BuildContext context, int idx) {
                        return Container(
                            padding: EdgeInsets.all(10.0),
                            child: ListTile(
                              onLongPress: () {
                                print('ListView, ${navList[idx]}');
                              },
                              leading: Icon(
                                navList[idx]['icon'],
                                color: Colors.grey[800],
                              ),
                              title: Text(navList[idx]['label']),
                            ));
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
