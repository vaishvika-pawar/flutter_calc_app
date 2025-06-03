abstract class CalculatorEvent {}

class NumberInput extends CalculatorEvent {
  final num number;
  final String currentaUserInput;

  NumberInput({required this.number, required this.currentaUserInput});
}

class OperatorInput extends CalculatorEvent {
  final String opr;
  final String currentaUserInput;

  OperatorInput({required this.opr, required this.currentaUserInput});
}

class Clear extends CalculatorEvent {}

class BackSpace extends CalculatorEvent {
  final String currentaUserInput;
  BackSpace({required this.currentaUserInput});
}

class ShowFinalResult extends CalculatorEvent {
  final String currentaUserInput;
  ShowFinalResult({required this.currentaUserInput});
}
