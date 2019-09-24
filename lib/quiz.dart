import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questionList;
  final Function answerQuestion;

  Quiz(
      {@required this.questionIndex,
      @required this.questionList,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questionList[questionIndex]['question'],
        ),
        ...(questionList[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['title']);
        }).toList()
      ],
    );
  }
}
