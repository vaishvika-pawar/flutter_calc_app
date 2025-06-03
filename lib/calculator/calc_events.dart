abstract class CalculatorEvent {}

class NumberInput extends CalculatorEvent {
  num number;
  String currentaUserInput;

  NumberInput({required this.number, required this.currentaUserInput});
}

class OperatorInput extends CalculatorEvent {
  String opr;
  String currentaUserInput;

  OperatorInput({required this.opr,required this.currentaUserInput});
}

class Clear extends CalculatorEvent {}

class BackSpace extends CalculatorEvent {
  String currentaUserInput;
  BackSpace({required this.currentaUserInput});
}

class ShowFinalResult extends CalculatorEvent {
  String currentaUserInput;
  ShowFinalResult({required this.currentaUserInput});
}