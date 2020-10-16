import 'package:bmi_app/Components/reusable_bottom_button.dart';
import 'package:bmi_app/Components/reusable_card.dart';
import 'package:bmi_app/Components/reusable_card_content.dart';
import 'package:bmi_app/calculator_brain.dart';
import 'package:bmi_app/components/reusable_alert_dialog.dart';
import 'package:bmi_app/screens/results_page.dart';
import 'package:bmi_app/services/advert-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

enum Gender { female, male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  AdvertService _advertService = AdvertService();
  CalculatorBrain calculatorBrain;

  Gender selectedGender = Gender.female;

  int height = 180;
  int weight = 60;
  int age = 30;

  Color genderTheme() {
    if (selectedGender == Gender.male)
      return Colors.blueAccent;
    else
      return kBottomContainerColor;
  }

  Color overlayIndicatorTheme() {
    if (selectedGender == Gender.male)
      return Colors.blueAccent.withOpacity(0.25);
    else
      return kBottomContainerColor.withOpacity(0.25);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _advertService.loadRewardedAd();
    _advertService.addRewardListener();
    _advertService.showBanner();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.video_collection_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              final titleText = 'Support us!';
              final bodyText = "Best way of supporting developers is clicking on ads!";
              final applyText = "Go to ad!";
              showRewardedAd(){
                Navigator.of(context).pop();
                _advertService.showReardedAd();
              }
              var rewardedAdAlert = MyCustomAlert(titleText: titleText, bodyText: bodyText, applyText: applyText, onPressApply: showRewardedAd);
              showDialog(
                  context: context,
                  builder: (BuildContext context) => rewardedAdAlert);
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusableCardContent(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: 'MALE',
                      selectedColor: selectedGender == Gender.male
                          ? Colors.blueAccent
                          : kActiveCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusableCardContent(
                      cardIcon: FontAwesomeIcons.venus,
                      cardText: 'FEMALE',
                      selectedColor: selectedGender == Gender.female
                          ? kBottomContainerColor
                          : kActiveCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: kNumberTextStyle),
                      Text(
                        'cm',
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 8.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 16.0),
                          //if girl boy color change
                          activeTrackColor: genderTheme(),
                          inactiveTrackColor: kInactiveCardColor,
                          thumbColor: genderTheme(),
                          overlayColor: overlayIndicatorTheme(),
                        ),
                        child: Slider(
                          min: kMinHeight,
                          max: kMaxHeight,
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          SizedBox(width: 10),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
              colour: kActiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 8.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 16.0),
                                activeTrackColor: genderTheme(),
                                inactiveTrackColor: kInactiveCardColor,
                                thumbColor: genderTheme(),
                                overlayColor: overlayIndicatorTheme(),
                              ),
                              child: Slider(
                                min: kMinWeight,
                                max: kMaxWeight,
                                value: weight.toDouble(),
                                onChanged: (double newValue) {
                                  setState(() {
                                    weight = newValue.round();
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(age.toString(), style: kNumberTextStyle),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 8.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 16.0),
                                activeTrackColor: genderTheme(),
                                inactiveTrackColor: kInactiveCardColor,
                                thumbColor: genderTheme(),
                                overlayColor: overlayIndicatorTheme(),
                              ),
                              child: Slider(
                                min: kMinAge,
                                max: kMaxAge,
                                value: age.toDouble(),
                                onChanged: (double newValue) {
                                  setState(() {
                                    age = newValue.round();
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            genderColor: genderTheme(),
            onPress: () {
              CalculatorBrain calc = CalculatorBrain(
                weight: weight,
                height: height,
                age: age,
                gender: selectedGender,
              );

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calc.calculateBmi(),
                            interpretation: calc.getInterpretation(),
                            resultText: calc.getResult(),
                            genderTheme: genderTheme(),
                            dailyCalories: calc.getDailyCalories(),
                          )));
            },
            text: 'CALCULATE',
          ),
          Divider(),
          Padding(padding: EdgeInsets.only(bottom: 55.0))
        ],
      ),
    );
  }
}
