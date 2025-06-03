import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calc_app/calculator/calc_events.dart';
import 'package:flutter_calc_app/calculator/calc_states.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());

  num? calculatedResult;
  List<num> listOfNumbers = [];
  List<String> listOfOperations = [];

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
    } else if (event is ShowFinalResult) {
      yield* calculateResult(event.currentaUserInput);
    }
  }

  Stream<CalculatorState> clearUserInput() async* {
    calculatedResult = null;
    listOfNumbers.clear();
    listOfOperations.clear();
    yield ShowUserInput(userInput: '');
  }

  Stream<CalculatorState> removeLastInput(String currentaUserInput) async* {
    final newInput =
        currentaUserInput.substring(0, currentaUserInput.length - 1);
    if (endsWithOperator(currentaUserInput)) {
      listOfOperations.removeLast();
    } else {
      if (listOfNumbers.isNotEmpty) {
        if (listOfNumbers.last.toString().length > 1) {
          String newNum = listOfNumbers.last.toString();
          newNum = newNum.substring(0, newNum.length - 1);
          listOfNumbers.last = num.parse(newNum);
        } else {
          listOfNumbers.removeLast();
        }
      }
    }

    yield ShowUserInput(userInput: newInput);
  }

  Stream<CalculatorState> addOperator(
      String opr, String currentaUserInput) async* {
    if (!(currentaUserInput.endsWith(opr) ||
        endsWithOperator(currentaUserInput))) {
      listOfOperations.add(opr);
      final newInput = currentaUserInput + opr;
      yield ShowUserInput(userInput: newInput);
    }
  }

  Stream<CalculatorState> addNumber(
      num number, String currentaUserInput) async* {
    if (listOfNumbers.isNotEmpty && !endsWithOperator(currentaUserInput)) {
      final newNum = "${listOfNumbers.last}$number";
      listOfNumbers.last = num.parse(newNum);
    } else {
      listOfNumbers.add(number);
    }
    final newInput = currentaUserInput + number.toString();
    yield ShowUserInput(userInput: newInput);
  }

  Stream<CalculatorState> calculateResult(String currentaUserInput) async* {
    print(listOfNumbers);
    print(listOfOperations);
    if (!endsWithOperator(currentaUserInput) &&
        listOfOperations.isNotEmpty &&
        listOfNumbers.isNotEmpty &&
        listOfNumbers.length > 1) {
      for (int opr = 0; opr < listOfOperations.length; opr++) {
        calculatedResult ??= listOfNumbers.elementAt(opr);
        calculatedResult = perfrormOperation(calculatedResult ?? 0,
            listOfOperations.elementAt(opr), listOfNumbers.elementAt(opr + 1));
      }
      yield ShowUserInput(userInput: calculatedResult.toString());
    }
  }

  bool endsWithOperator(String currentaUserInput) {
    return currentaUserInput.endsWith("%") ||
        currentaUserInput.endsWith("/") ||
        currentaUserInput.endsWith("x") ||
        currentaUserInput.endsWith("-") ||
        currentaUserInput.endsWith("+");
  }

  num perfrormOperation(num calculatedResult, String opr, num number) {
    switch (opr) {
      case "%":
        return calculatedResult.remainder(number);
      case "/":
        return (calculatedResult / number).floor();
      case "x":
        return calculatedResult * number;
      case "-":
        return calculatedResult - number;
      case "+":
        return calculatedResult + number;
      default:
        return 0;
    }
  }
}
