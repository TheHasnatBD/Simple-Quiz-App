import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get finalResultText {
    String text;
    if (resultScore == 0) {
      text = 'So bad';
    } else if (resultScore <= 3) {
      text = 'Poor marks';
    } else if (resultScore <= 5) {
      text = 'Average marks';
    } else if (resultScore <= 8) {
      text = 'Good marks';
    } else if (resultScore <= 12) {
      text = 'Execellent';
    } else if (resultScore <= 16) {
      text = 'Wow!! Congrats, all correct';
    } else {
      text = 'Quiz end';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text(
              "You finished your quiz.",
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              finalResultText,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              textAlign: TextAlign.center,
            ),
            Text(
              "Score: $resultScore",
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text(
                "Try again",
              ),
              padding: EdgeInsets.all(3),
              textColor: Colors.blue,
              hoverColor: Colors.red,
              onPressed: resetHandler,
            )
          ],
        ),
      ),
    );
  }
}
