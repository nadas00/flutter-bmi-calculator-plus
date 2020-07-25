import 'package:bmi_app/Components/reusable_bottom_button.dart';
import 'package:bmi_app/Components/reusable_card.dart';
import 'package:bmi_app/Components/reusable_card_content.dart';
import 'package:bmi_app/Components/reusable_round_Icon_Button.dart';
import 'package:bmi_app/calculator_brain.dart';
import 'package:bmi_app/screens/results_page.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        /*actions: <Widget>[
          FlatButton(
            color: genderTheme(),
            onPressed: () {
              setState(() {
               selectedLang == Language.en
                    ? selectedLang = Language.tr
                    : selectedLang = Language.en;

                languageBrain.setLanguage(selectedLang);
              });
            },
            child: Row(
              children: <Widget>[Icon(Icons.language), Text('lang')],
            ),
          ),
        ],*/
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
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                if (height > kMinHeight) {
                                  height--;
                                }
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                if (height < kMaxHeight) {
                                  height++;
                                }
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
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
                          'WEUGHT',
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
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      if (weight > kMinWeight) {
                                        weight--;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (weight < kMaxWeight) {
                                        weight++;
                                      }
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                                ),
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
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      if (age > kMinAge) {
                                        age--;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (age < kMaxAge) {
                                        age++;
                                      }
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                                ),
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
        ],
      ),
    );
  }
}
