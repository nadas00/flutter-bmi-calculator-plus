import 'package:bmi_app/Components/reusable_bottom_button.dart';
import 'package:bmi_app/Components/reusable_card.dart';
import 'package:bmi_app/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResultPage extends StatelessWidget {
  static CalculatorBrain calculatorBrain;

  final String bmiResult;
  final String resultText;
  final String interpretation;
  final Color genderTheme;
  final double dailyCalories;

  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation,
      @required this.genderTheme,
      @required this.dailyCalories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESULTS'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: kTitleStyle,
              ),
              alignment: Alignment.bottomLeft,
            ),
          ),
          Expanded(
            flex: 8,
            child: ReusableCard(
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBmiTextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Basal Metabolic Rate (BMR) :',
                          style: kLabelTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            dailyCalories.toStringAsFixed(1),
                            style: kTitleStyle,
                          ),
                          Text(
                            'kcal/day',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              colour: kActiveCardColor,
            ),
          ),
          BottomButton(
            text: 'RE-CALCULATE',
            onPress: () {
              Navigator.pop(context);
            },
            genderColor: genderTheme,
          )
        ],
      ),
    );
  }
}
