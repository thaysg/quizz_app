import 'package:flutter/material.dart';
import 'package:quizz_app/classes/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int rightAnswer = 0;
  int wrongAnswer = 0;

  void checkAnswer(bool userPickerAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        _onAlertButtonsPressed(context);

        quizBrain.reset();

        rightAnswer = 0;
        wrongAnswer = 0;
      } else {
        if (userPickerAnswer == correctAnswer) {
          rightAnswer += 1;
        } else {
          wrongAnswer += 1;
        }
        quizBrain.nextQuestion();
      }
    });
  }

  _onAlertButtonsPressed(context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          child: Text(
            "COOL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {},
          width: 120,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              //Score
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Score',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 32,
                            ),
                            Text(
                              '$rightAnswer',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 32,
                            ),
                            Text(
                              '$wrongAnswer',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              //Text
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    quizBrain.getQuestions(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
              //True or False
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FlatButton(
                        onPressed: () {
                          checkAnswer(true);
                          /* setState(() {
                            correctAnswer();
                            quizBrain.nextQuestion();
                          }); */
                        },
                        color: Colors.green,
                        height: 100,
                        textColor: Colors.white,
                        child: Text(
                          'True',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FlatButton(
                        onPressed: () {
                          checkAnswer(false);
                          /* setState(() {
                            wrongestAnswer();
                            quizBrain.nextQuestion();
                          }); */
                        },
                        color: Colors.red,
                        height: 100,
                        textColor: Colors.white,
                        child: Text(
                          'False',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
