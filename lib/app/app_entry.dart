import 'package:flutter/material.dart';
import 'package:flutter_calc_app/calculator/calc_page.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorPage(
        key: ValueKey('calculatorPage'),
      ),
    );
  }
}
