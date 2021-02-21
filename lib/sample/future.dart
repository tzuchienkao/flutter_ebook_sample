import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ebook_sample/sample/sample.dart' show Person;
import 'package:flutter_ebook_sample/sample/material_design.dart' show appTabs;
import 'package:flutter_ebook_sample/sample/future_http.dart';

class AppDialog extends StatefulWidget {
  @override
  _AppDialogState createState() => _AppDialogState();
}

class _AppDialogState extends State<AppDialog> {
  Future<void> _showAppDialog() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: [
              SimpleDialogOption(
                onPressed: () async {
                  Provider.of<Person>(context, listen: false).increaseCounter();
                  Navigator.of(context).pop(true);
                },
                child: Icon(
                  Icons.plus_one,
                  color: Colors.cyan[300],
                  size: 40.0,
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.sentiment_satisfied_alt,
        color: Colors.white,
      ),
      onPressed: () {
        _showAppDialog();
      },
    );
  }
}

class AppAsync extends StatefulWidget {
  @override
  _AppAsyncState createState() => _AppAsyncState();
}

class _AppAsyncState extends State<AppAsync> {
  Future<void> _showAppSimpleDialog() async {
    return await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: [
              SimpleDialogOption(
                onPressed: () async {
                  Provider.of<Person>(context, listen: false).increaseCounter();
                  Navigator.of(context).pop(true);
                },
                child: Icon(
                  Icons.plus_one,
                  color: Colors.cyan[300],
                  size: 40.0,
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<Person>(context).counter != 0
        ? FutureBuilder(
            future: fetchAlbum(Provider.of<Person>(context).counter),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Text(
                    '${snapshot.data.title}, counter: ${Provider.of<Person>(context).counter}');
                // return Text(snapshot.data);
              }
              return CircularProgressIndicator();
            })
        : TabBarView(
            children: appTabs.map((Tab tab) {
              return Center(
                  child: FlatButton(
                      onPressed: () {
                        _showAppSimpleDialog();
                      },
                      child: Text('Flat Button - ${tab.text}')));
            }).toList(),
          );

    // return FutureBuilder(
    //     future: fetchAlbum(),
    //     builder: (BuildContext context, AsyncSnapshot snapshot) {
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         return Text(snapshot.data.title);
    //         // return Text(snapshot.data);
    //       }
    //       return CircularProgressIndicator();
    //     });
  }
}
