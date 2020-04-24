import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal.shade700,
        appBar: AppBar(
          title: Text(
              'Dice Boss',
              style: TextStyle(
                fontFamily: 'Pacifico',
              ),
          ),
          backgroundColor: Colors.teal.shade800,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void generateRandomNumber(){
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: FlatButton(
              child: Image.asset('images/dice$leftDiceNumber.png'),
              onPressed: (){
                //setState() calls the build function again to rebuild the app using the changed value dynamically.
                setState(() {
                  generateRandomNumber();
                });
              },
            ),
          ),
          Expanded(
            flex: 1,  //look up the purpose of flex - something to do with deciding the ratio in which two expanded widgets occupy the screen.
            child: FlatButton(
              child: Image.asset('images/dice$rightDiceNumber.png'),
              onPressed: (){
                setState(() {
                  generateRandomNumber();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

