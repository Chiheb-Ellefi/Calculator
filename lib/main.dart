import 'package:flutter/material.dart';
import 'package:calculator/button.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp(const MaterialApp(
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);


  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userQuestion='';
  var userAnswer='';
  final List<String> buttons=[
    'C','Del','%','/',
    '9','8','7','*',
    '6','5','4','-',
    '3','2','1','+',
    '0','.','ANS','=',
  ];
  bool? isOperator(String o){
    if (o == '+' || o == '-' || o == '*' || o == '/' || o == '%' ) {
      return true;
    }
    else {
      return false;
    }
  }
  void equalPressed(){
    final String finalQuestion=userQuestion;
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer=eval.toString();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: Column(
        children: [
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 50.0,),
                  Container(
                    padding:const  EdgeInsets.all(20.0),
                    alignment:Alignment.centerLeft ,
                    child: Text(
                      userQuestion,
                      style: const TextStyle(fontSize: 30.0),
                    ),
                  ),
                  Container(
                    padding:const  EdgeInsets.all(20.0),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      userAnswer,
                      style: const TextStyle(fontSize: 30.0),
                    ),
                  ),
                ],
              ),
          ),

          Expanded(
            flex: 2,
              child: GridView.builder(
                itemCount: buttons.length,
                  gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (BuildContext context , int index ){
                    if (index == 0 ) {
                      return MyButton(
                        buttonTapped: (){
                          setState(() {
                            userQuestion='';
                          });
                        },
                      buttontext: buttons[index],
                      color: Colors.green,
                      textcolor: Colors.white,
                    );}
                    else if (index == 1) {
                      return MyButton(
                        buttonTapped: (){
                          setState(() {
                            userQuestion=userQuestion.substring(0,userQuestion.length-1);
                          });
                        },
                      buttontext: buttons[index],
                      color: Colors.red,
                      textcolor: Colors.white,
                    );}
                    else if (index==buttons.length-1){
                      return MyButton(
                        buttonTapped: (){
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttontext: buttons[index],
                        color: Colors.deepPurple,
                        textcolor: Colors.white,
                      );

                    }
                    else {
                      return MyButton(
                        buttonTapped: (){
                          setState(() {
                            userQuestion=userQuestion+buttons[index];
                          });
                        },
                        buttontext: buttons[index],
                        color: isOperator(buttons[index])! ?Colors.deepPurple: Colors.deepPurple[50],
                        textcolor: isOperator(buttons[index])! ? Colors.white: Colors.deepPurple,
                      );}
                    },
                   )
          ),
        ],
      ),
    );
  }
}
