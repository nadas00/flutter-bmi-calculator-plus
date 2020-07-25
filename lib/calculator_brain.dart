import 'dart:math';

import 'package:bmi_app/screens/input_page.dart';
import 'package:flutter/cupertino.dart';

class CalculatorBrain {
  final int height;
  final int weight;
  Gender gender;
  final int age;

  double _bmi;

  CalculatorBrain(
      {@required this.age,
      @required this.gender,
      @required this.height,
      @required this.weight});

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 40.0) {
      return 'Obese Class III';
    } else if (_bmi >= 35.0) {
      return 'Obese Class II';
    } else if (_bmi >= 30.0) {
      return 'Obese Class I';
    } else if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else if (_bmi >= 17) {
      return 'Mild Thinness';
    } else if (_bmi >= 16) {
      return 'Moderate Thinness';
    } else {
      return 'Severe Thinness';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }

  double getDailyCalories() {
    if (gender == Gender.female)
      return 655 + 9.6 * weight + 1.8 * height - 4.7 * age;
    else
      return 66 + 13.7 * weight + 5 * height - 6.8 * age;
  }
}
