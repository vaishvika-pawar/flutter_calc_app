import 'package:flutter/material.dart';
import 'package:flutter_calc_app/app/app_entry.dart';

void main() {
  runApp(
    const CalculatorApp(
      key: ValueKey('initializeCalculator'),
    ),
  );
}
