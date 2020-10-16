import 'package:flutter/material.dart';

class MyCustomAlert extends StatelessWidget {
  final titleText;
  final bodyText;
  final Function onPressApply;
  final applyText;

  const MyCustomAlert(
      {@required this.titleText,
        @required this.bodyText,
        @required this.onPressApply,
        this.applyText});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text(titleText),
      content: Text(bodyText),
      actions: <Widget>[
        FlatButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(applyText ?? 'Settings'),
          onPressed: onPressApply,
        ),
      ],
    );
  }
}
