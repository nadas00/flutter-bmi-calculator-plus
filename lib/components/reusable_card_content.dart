import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ReusableCardContent extends StatelessWidget {
  ReusableCardContent(
      {@required this.cardIcon,
      @required this.cardText,
      @required this.selectedColor});

  final IconData cardIcon;
  final String cardText;
  final Color selectedColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardIcon,
          color: selectedColor,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
