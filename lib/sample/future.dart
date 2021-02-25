import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ebook_sample/sample/sample.dart' show Person;

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
