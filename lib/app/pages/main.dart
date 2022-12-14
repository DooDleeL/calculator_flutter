import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../components/menu.dart';
import '../components/button_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String calculation = "";
  double result = 0;

  addCharacter(String text) {
    setState(()  {
      calculation = calculation + text;
    });
  }

  calcResult () {
    List<String> characters = [];
    List<double> numbers = [];
    calculation.split('').forEach((element) => {
      if(element == '*' || element == '/' || element == '-' || element == '+') {
        characters.add(element)
      } else {
        numbers.add(double.parse(element))
      }
    });

    double total = 0;
    int currentCharacter = 0;
    double n1 = numbers[0];
    double n2 = numbers[1];
    switch(characters[currentCharacter]){
      case '+': {
        total = n1 + n2;
        break;
      }
      case '-': {
        total = n1 - n2;
        break;
      }
      case '*': {
        total = n1 * n2;
        break;
      }
      case '/': {
        total = n1 / n2;
        break;
      }
      default: {
        total: total;
        break;
      }
    }
    characters.removeAt(0);

    for(int i = 2 ; i <= numbers.length; i++ ) {
      if(characters.length <= 0) break;
      switch(characters[0]){
        case '+': {
          total = total + numbers[i];
          break;
        }
        case '-': {
          total = total - numbers[i];
          break;
        }
        case '*': {
          total = total * numbers[i];
          break;
        }
        case '/': {
          total = total / numbers[i];
          break;
        }
        default: {
          total: total;
          break;
        }
      }
      characters.removeAt(0);
    }
    setState(() {
      result = total;
    });
  }

  void clearCalculation() {
    setState(() {
      calculation = '';
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Menu(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 120,
              child: Column(
                children: <Widget>[
                  Text(calculation, style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),),
                  Text(result.toString(), style: TextStyle(
                    fontSize: 62,
                    color: Colors.grey,
                  ),),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(context, '7',() { addCharacter('7'); }, Colors.grey),
                Button(context, '8',() { addCharacter('8'); }, Colors.grey),
                Button(context, '9',() { addCharacter('9'); }, Colors.grey),
                Button(context, '+',() { addCharacter('+'); }, Colors.black54),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(context, '4',() { addCharacter('4'); }, Colors.grey ),
                Button(context, '5',() { addCharacter('5'); }, Colors.grey ),
                Button(context, '6',() { addCharacter('6'); }, Colors.grey ),
                Button(context, '-',() { addCharacter('-'); }, Colors.black54 ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(context, '1',() { addCharacter('1'); }, Colors.grey ),
                Button(context, '2',() { addCharacter('2'); }, Colors.grey ),
                Button(context, '3',() { addCharacter('3'); }, Colors.grey ),
                Button(context, '*',() { addCharacter('*'); }, Colors.black87 ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(context, '=',() { calcResult(); }, Colors.black87 ),
                Button(context, '0',() { addCharacter('0'); }, Colors.grey ),
                Button(context, 'c',clearCalculation, Colors.black87 ),
                Button(context, '/',() { addCharacter('/'); }, Colors.black87 ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
