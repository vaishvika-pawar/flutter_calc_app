import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calc_app/calculator/calc_events.dart';
import 'package:flutter_calc_app/calculator/calc_states.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    if (event is Clear) {
      yield* clearUserInput();
    } else if (event is BackSpace) {
      yield* removeLastInput(event.currentaUserInput);
    } else if (event is OperatorInput) {
      yield* addOperator(event.opr, event.currentaUserInput);
    } else if (event is NumberInput) {
      yield* addNumber(event.number, event.currentaUserInput);
    } else if (event is ShowFinalResult){
      yield* calculateResult(event.currentaUserInput);
    }
  }

  Stream<CalculatorState> clearUserInput() async* {
    yield ShowUserInput(userInput: '');
  }

  Stream<CalculatorState> removeLastInput(String currentaUserInput) async* {
    final newInput = currentaUserInput.substring(0, currentaUserInput.length-1);
    yield ShowUserInput(userInput: newInput);
  }

  Stream<CalculatorState> addOperator(
      String opr, String currentaUserInput) async* {
    final newInput = currentaUserInput + opr;
    yield ShowUserInput(userInput: newInput);
  }

  Stream<CalculatorState> addNumber(
      num number, String currentaUserInput) async* {
    final newInput = currentaUserInput + number.toString();
    yield ShowUserInput(userInput: newInput);
  }

  Stream<CalculatorState> calculateResult(
      String currentaUserInput) async* {
    final newInput = currentaUserInput;
    yield ShowUserInput(userInput: newInput);
  }
}
