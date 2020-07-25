import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {@required this.onPress,
      @required this.text,
      @required this.genderColor});
  final Function onPress;
  final String text;
  final Color genderColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kLargeButtonTextStyle,
          ),
        ),
        padding: EdgeInsets.only(bottom: 10.0),
        margin: EdgeInsets.only(top: 5.0),
        color: genderColor,
        height: kBottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}
