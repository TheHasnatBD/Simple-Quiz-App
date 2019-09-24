import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'question': 'Q 1 - On which thread services work in android?',
      'answers': [
        {'title': 'Main Thread', 'score': 2},
        {'title': 'Worker Thread', 'score': 0},
        {'title': 'Own Thread', 'score': 0},
        {'title': 'All of these', 'score': 0}
      ]
    },
    {
      'question':
          'Q 2 - What is the time limit of broadcast receiver in android?',
      'answers': [
        {'title': '0 sec', 'score': 0},
        {'title': '10 sec', 'score': 2},
        {'title': '120 sec', 'score': 0},
        {'title': 'None', 'score': 0}
      ]
    },
    {
      'question': 'Q 3 - What is JNI in android?',
      'answers': [
        {'title': 'Dart interface', 'score': 0},
        {'title': 'Java network interface', 'score': 0},
        {'title': 'Java native interface.', 'score': 2},
        {'title': 'Image editable tool', 'score': 0}
      ]
    },
    {
      'question': 'Q 4 - How many ports are allocated for new emulator?',
      'answers': [
        {'title': '1000+', 'score': 0},
        {'title': '100', 'score': 0},
        {'title': '0', 'score': 0},
        {'title': '2', 'score': 2}
      ]
    },
    {
      'question': 'Q 5 -  How to find the JSON element length in android JSON?',
      'answers': [
        {'title': 'length()', 'score': 2},
        {'title': 'add()', 'score': 0},
        {'title': 'sum()', 'score': 0},
        {'title': 'count()', 'score': 0}
      ]
    },
    {
      'question':
          'Q 6 - What is the life cycle of foreground activity in android?',
      'answers': [
        {
          'title': 'onCreate() −> onStart() −> onResume() −>onStop()',
          'score': 0
        },
        {'title': ' onCreate() −> onStart() −> onResume()', 'score': 2},
        {
          'title':
              'onCreate() −> onStart() −> onResume() −> onStop() −> onRestart',
          'score': 0
        },
        {'title': 'None of these avobe', 'score': 0}
      ]
    },
    {
      'question': 'Q 7 - What does httpclient.execute() returns in android?',
      'answers': [
        {'title': 'Http result', 'score': 0},
        {'title': 'Http stop', 'score': 0},
        {'title': 'Http response', 'score': 2},
        {'title': 'Http off', 'score': 0}
      ]
    },
    {
      'question': 'Q 8 - Which language is used in Flutter?',
      'answers': [
        {'title': 'PHP', 'score': 0},
        {'title': 'Kotlin', 'score': 0},
        {'title': 'Java', 'score': 0},
        {'title': 'Dart', 'score': 2}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    if (_questionIndex < _questions.length) {
      print("More question");
    } else {
      print("End question");
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questionIndex: _questionIndex,
                questionList: _questions,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
