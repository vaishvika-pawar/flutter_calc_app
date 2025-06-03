import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calc_app/calculator/calc_bloc.dart';
import 'package:flutter_calc_app/calculator/calc_data.dart';
import 'package:flutter_calc_app/calculator/calc_events.dart';
import 'package:flutter_calc_app/calculator/calc_states.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  CalculatorPageState createState() => CalculatorPageState();
}

class CalculatorPageState extends State<CalculatorPage> {
  final calculatorBloc = CalculatorBloc();
  final TextEditingController calcTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder(
            bloc: calculatorBloc,
            builder: (context, state) {
              if (state is ShowUserInput) {
                calcTextController.text = state.userInput;
              }
              return Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                      style: TextStyle(fontSize: 24, color: Colors.deepPurple.shade500),
                        controller: calcTextController,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        maxLines: 10,
                        enabled: true,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              calculatorBloc.add(BackSpace(currentaUserInput: calcTextController.text));
                            },
                            icon: Icon(
                              Icons.backspace_rounded,
                              color: Colors.deepPurple.shade200,
                            ))
                      ],
                    ),
                    Divider(
                      color: Colors.deepPurple.shade100,
                    ),
                    Expanded(
                      flex: 2,
                      child: Wrap(
                        spacing: 16,
                        children: [
                          CalcButtons(
                            calcObj: CalcObj(buttonText: "C",onpressEvent: Clear()), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: "()",onpressEvent: Clear()), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: "%",onpressEvent: OperatorInput(opr: "%",currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: "/",onpressEvent: OperatorInput(opr: "%",currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: "7",onpressEvent: NumberInput(number: 7,currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: "8",onpressEvent: NumberInput(number: 8,currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: "9",onpressEvent: NumberInput(number: 9,currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: "x",onpressEvent: OperatorInput(opr: "x",currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: "4",onpressEvent: NumberInput(number: 4,currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: "5",onpressEvent: NumberInput(number: 5,currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: "6",onpressEvent: NumberInput(number: 6,currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: "-",onpressEvent: OperatorInput(opr: "-",currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: "1",onpressEvent: NumberInput(number: 1,currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: "2",onpressEvent: NumberInput(number: 2,currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: "3",onpressEvent: NumberInput(number: 3,currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: "+",onpressEvent: OperatorInput(opr: "+",currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: "+/-",onpressEvent: OperatorInput(opr: "+/-",currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                            calcObj: CalcObj( buttonText: "0",onpressEvent: OperatorInput(opr: "%",currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                             calcObj: CalcObj(buttonText: ".",onpressEvent: OperatorInput(opr: ".",currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                          CalcButtons(
                            buttonColor: Colors.deepPurple.shade200,
                            calcObj: CalcObj(buttonText: "=",onpressEvent: ShowFinalResult(currentaUserInput: calcTextController.text)), calculatorBloc: calculatorBloc
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class CalcButtons extends StatelessWidget {
  final CalculatorBloc calculatorBloc;
  final CalcObj calcObj;
  final Color? buttonColor;
  const CalcButtons({
    required this.calculatorBloc,
    required this.calcObj,
    this.buttonColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          calculatorBloc.add(calcObj.onpressEvent);
        },
        child: CircleAvatar(
          backgroundColor: buttonColor ?? Colors.deepPurple.shade50,
          radius: 35,
          child: Text(
            calcObj.buttonText,
            style: TextStyle(fontSize: 24, color: Colors.deepPurple.shade500),
          ),
        ),
      ),
    );
  }
}
