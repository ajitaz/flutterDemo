import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List questions = const [
    {
      'question': 'What\'s your favorite Color?',
      'answers': ['Red', 'Blue', 'Yellow', 'Green']
    },
    {
      'question': 'What\'s your favorite Animal?',
      'answers': ['Dog', 'Tiger', 'Elephant', 'Horse']
    },
    {
      'question': 'What\'s your favorite Music Genre?',
      'answers': ['Punk', 'Rock', 'Jazz', 'Metal']
    }
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    if (_questionIndex < questions.length) {
      print('There is more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DemoApp'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['question'],
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('Yes you did it!!!'),
              ),
      ),
    );
  }
}
