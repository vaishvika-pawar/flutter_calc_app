abstract class CalculatorEvent {}

class NumberInput extends CalculatorEvent {
  num number;

  NumberInput({required this.number});
}

class OperatorInput extends CalculatorEvent {
  String opr;

  OperatorInput({required this.opr});
}

class Clear extends CalculatorEvent {}

class BackSpace extends CalculatorEvent {}

class ShowFinalResult extends CalculatorEvent {}