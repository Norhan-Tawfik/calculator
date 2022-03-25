import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String result = '0';
  String finalResult = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String opr = '';

  buttonPressed (String btnValue)
  {
    if(btnValue == 'AC')
      {
        finalResult = '0';
        num1 = 0.0;
        num2 = 0.0;
        opr = '';

      }
    else if(btnValue=='+'||btnValue=='-'||btnValue=='x'||btnValue=='/')
      {
           num1 = double.parse(result);
           opr = btnValue;
           finalResult = '0';
           result = result + btnValue;
      }

    else if(btnValue=='.')
      {
          if(finalResult.contains('.'))
            {

            }else
              {
                finalResult = finalResult + btnValue;
              }
      }

    else if(btnValue=='+/-')
      {
        if(finalResult.contains('-'))
        {
              result.toString().substring(1);
              finalResult = result;
        }
        else
          {
             result = '-' + result;
             finalResult = result;
          }
      }

    else if(btnValue=='%')
      {

        num2 = double.parse(result);
        finalResult = (num2/100).toString();

      }

    else if(btnValue=='=')
      {
        num2 = double.parse(result);
        if(opr=='+')
          {
            finalResult = (num1 + num2).toString();
          }
        if(opr=='-')
        {
          finalResult = (num1 - num2).toString();
        }
        if(opr=='x')
        {
          finalResult = (num1 * num2).toString();
        }
        if(opr=='/')
        {
          finalResult = (num1 / num2).toString();
        }
      }

    else
      {
        finalResult = finalResult + btnValue;
      }

    setState(() {
      result = double.parse(finalResult).toString();
    });
  }

  Widget buttonForm(String txtButton, Color txtColor, Color backgroundButton) {
    if (txtButton != '=') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {
            
            buttonPressed(txtButton);


          },
          shape: CircleBorder(),
          fillColor: backgroundButton,
          padding: EdgeInsets.all(15),
          child: Text(
            txtButton,
            style: TextStyle(
              fontSize: 35,
              color: txtColor,
            ),
          ),
        ),
      );
    } else {
      return Container(
        child: RawMaterialButton(
          onPressed: () {
            buttonPressed(txtButton);

          },
          shape: StadiumBorder(),
          fillColor: backgroundButton,
          padding: EdgeInsets.fromLTRB(75, 15, 75, 15),
          child: Text(
            txtButton,
            style: TextStyle(
              fontSize: 35,
              color: txtColor,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        title: Text(
          "Calculator",
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "$finalResult",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 100,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm('AC', Colors.white, Colors.blueGrey),
                buttonForm('+/-', Colors.white, Colors.blueGrey),
                buttonForm('%', Colors.white, Colors.blueGrey),
                buttonForm('/', Colors.blueGrey, Colors.white)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm('7', Colors.white, Colors.blueGrey),
                buttonForm('8', Colors.white, Colors.blueGrey),
                buttonForm('9', Colors.white, Colors.blueGrey),
                buttonForm('x', Colors.blueGrey, Colors.white)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm('4', Colors.white, Colors.blueGrey),
                buttonForm('5', Colors.white, Colors.blueGrey),
                buttonForm('6', Colors.white, Colors.blueGrey),
                buttonForm('-', Colors.blueGrey, Colors.white)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm('1', Colors.white, Colors.blueGrey),
                buttonForm('2', Colors.white, Colors.blueGrey),
                buttonForm('3', Colors.white, Colors.blueGrey),
                buttonForm('+', Colors.blueGrey, Colors.white)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm('0', Colors.white, Colors.blueGrey),
                buttonForm('.', Colors.white, Colors.blueGrey),
                buttonForm('=', Colors.blueGrey, Colors.white)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
