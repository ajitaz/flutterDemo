import 'package:demo/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, Object>> _questions = const [
    {
      'question': 'What\'s your favorite Color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Blue', 'score': 8},
        {'text': 'Yellow', 'score': 5},
        {'text': 'Green', 'score': 3},
      ]
    },
    {
      'question': 'What\'s your favorite Animal?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Elephant', 'score': 8},
        {'text': 'Tiger', 'score': 5},
        {'text': 'Horse', 'score': 3},
      ]
    },
    {
      'question': 'What\'s your favorite Music Genre?',
      'answers': [
        {'text': 'Punk', 'score': 10},
        {'text': 'Jazz', 'score': 8},
        {'text': 'Rock', 'score': 5},
        {'text': 'Metal', 'score': 3},
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    if (_questionIndex < _questions.length) {
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
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
