import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetHandler;

  Result(this.score, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (score <= 9) {
      resultText = 'Ok man thats ok.\nYour score => $score';
    } else if (score <= 15) {
      resultText = 'Well well what can i say.\nYour score => $score';
    } else {
      resultText = 'Woah thats something!!\n Your score => $score';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
            child: Text('Reset'),
            style: OutlinedButton.styleFrom(primary: Colors.orange,side: BorderSide(color: Colors.orange)),
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
