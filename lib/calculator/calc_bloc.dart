import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calc_app/calculator/calc_events.dart';
import 'package:flutter_calc_app/calculator/calc_states.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());
  
}
