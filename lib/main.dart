
import 'package:flutter/material.dart';
import 'calculator_botton.dart';


// Initialize

class Stack<T> {
  final List<T> _list = [];
  void push(T value) => _list.add(value);
  T? pop() => _list.removeLast();
  T? peek() => _list.last;
  void clear() => _list.clear();
  int get length => _list.length;
  String toString() => _list.join(' ');
}
final stack= Stack<num>();

void main() {
  runApp(CalculatorApp());

}

class CalculatorApp  extends StatefulWidget {
  CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {

  late int firstNum;
  late int secondNum;

  late String history = '';
  late String textToDisplay = '';
  late String res;
  late String operation;


  void btnOnClick(String btnVal){
    print(btnVal);
    // clear
    if( btnVal== 'C'){
      textToDisplay= '';
      firstNum =0;
      secondNum=0;
      res = '';

    }
    //clear history
    else if( btnVal == 'AC'){
      textToDisplay= '';
      firstNum =0;
      secondNum=0;
      res = '';
      history = '';
      stack.clear();

    }
    // + or -
    else if( btnVal == '+/-'){
      if(textToDisplay[0] != '-') {
        res = '-'+textToDisplay;
      } else{
        res = textToDisplay.substring(1);
      }
    }
    //delete
    else if( btnVal == '<<'){
      res= textToDisplay.substring(0, textToDisplay.length-1);
    }
    // operation
    else if( btnVal == '+' || btnVal == '-' || btnVal == 'X' || btnVal == '/' ){
     firstNum = int.parse(textToDisplay);
     res= '';
     operation =btnVal;
    }

    // Enter button Operaction
    else if( btnVal == 'Enter'){
      secondNum = int.parse(textToDisplay);

      if(operation == '+' ){
        res = (firstNum + secondNum).toString();
        history= firstNum.toString() + operation.toString() + secondNum.toString();
        stack.push(firstNum + secondNum);
        print(stack.peek());

      }
      if(operation == '-' ){
        res = (firstNum - secondNum).toString();
        history= firstNum.toString() + operation.toString() + secondNum.toString();
        stack.push(firstNum - secondNum);
        print(stack.peek());
      }

      if(operation == 'X' ){
        res = (firstNum * secondNum).toString();
        history= firstNum.toString() + operation.toString() + secondNum.toString();
        stack.push(firstNum * secondNum);
        print(stack.peek());
      }

      if(operation == '/' ){
        res = (firstNum / secondNum).toString();
        history= firstNum.toString() + operation.toString() + secondNum.toString();
        stack.push(firstNum / secondNum);
        print(stack.peek());
      }
    } else{
      res = int.parse(textToDisplay + btnVal).toString();
      stack.push(int.parse(textToDisplay + btnVal));
    }

    setState(() {
      textToDisplay = res;
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator App'),
        ),
        backgroundColor: Colors.indigo,
        body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Container(
                  child: Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Text(
                     history,
                      style:TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0,1.0),
                ),

                Container(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                     textToDisplay,
                      style:TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0,1.0),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: 'AC',
                    fillColor: 0xff8ac4d0,
                    textColor: 0xff000000, // black
                    textSize:20 ,
                    callback: btnOnClick,
                  ),


                  CalculatorButton(text: 'C',
                    fillColor: 0xff8ac4d0,
                    textColor: 0xff000000, // black
                    textSize:20 ,
                    callback: btnOnClick,
                  ),


                  CalculatorButton(text: '<<',
                    fillColor: 0xFFf4d160,
                    textColor: 0xff000000, // black
                    textSize:15 ,
                    callback: btnOnClick,
                  ),


                  CalculatorButton(text: '/',
                    fillColor: 0xFF42A5F5,
                    textColor: 0xff000000, // black
                    textSize:20 ,
                    callback: btnOnClick,
                  ),

                ],
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(text: '9',
                      fillColor: 0xff8ac4d0,
                      textColor: 0xff000000, // black
                      textSize:20 ,
                      callback: btnOnClick,
                    ),

                    CalculatorButton(text: '8',
                      fillColor: 0xff8ac4d0,
                      textColor: 0xff000000, // black
                      textSize:20 ,
                      callback: btnOnClick,
                    ),


                    CalculatorButton(text: '7',
                      fillColor: 0xff8ac4d0,
                      textColor: 0xff000000, // black
                      textSize:20 ,
                      callback: btnOnClick,
                    ),


                    CalculatorButton(text: 'X',
                      fillColor: 0xFF42A5F5,
                      textColor: 0xff000000, // black
                      textSize:20 ,
                      callback: btnOnClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(text: '6',
                      fillColor: 0xff8ac4d0,
                      textColor: 0xff000000, // black
                      textSize:20 ,
                      callback: btnOnClick,
                    ),

                    CalculatorButton(text: '5',
                      fillColor: 0xff8ac4d0,
                      textColor: 0xff000000, // black
                      textSize:20 ,
                      callback: btnOnClick,
                    ),


                    CalculatorButton(text: '4',
                      fillColor: 0xff8ac4d0,
                      textColor: 0xff000000, // black
                      textSize:20 ,
                      callback: btnOnClick,
                    ),


                    CalculatorButton(text: '-',
                      fillColor: 0xFF42A5F5,
                      textColor: 0xff000000, // black
                      textSize:20 ,
                      callback: btnOnClick,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(text: '3',
                      fillColor: 0xff8ac4d0,
                      textColor: 0xff000000, // black
                      textSize:20 ,
                      callback: btnOnClick,
                    ),

                    CalculatorButton(text: '2',
                      fillColor: 0xff8ac4d0,
                      textColor: 0xff000000, // black
                      textSize:20 ,
                      callback: btnOnClick,
                    ),


                    CalculatorButton(text: '1',
                      fillColor: 0xff8ac4d0,
                      textColor: 0xff000000, // black
                      textSize:20 ,
                      callback: btnOnClick,
                    ),


                    CalculatorButton(text: '+',
                      fillColor: 0xFF42A5F5,
                      textColor: 0xff000000, // black
                      textSize:20 ,
                      callback: btnOnClick,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(text: '+/-',
                      fillColor: 0xff8ac4d0,
                      textColor: 0xff000000, // black
                      textSize:20 ,
                      callback: btnOnClick,
                    ),

                    CalculatorButton(text: '0',
                      fillColor: 0xff8ac4d0,
                      textColor: 0xff000000, // black
                      textSize:20 ,
                      callback: btnOnClick,
                    ),

                    // clear Botton
                    CalculatorButton(text: '00',
                      fillColor: 0xff8ac4d0,
                      textColor: 0xff000000, // black
                      textSize:20 ,
                      callback: btnOnClick,
                    ),

                    CalculatorButton(text: 'Enter',
                      fillColor: 0xFFf4d160,
                      textColor: 0xff000000, // black
                      textSize:20 ,
                      callback: btnOnClick,
                    ),
                  ],
                ),

            ],)
        ),
      ),
    );
  }
}
