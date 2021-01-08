import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int rightAnswer = 0;
  int wrongAnswer = 0;

  /* List<String> questions = [
    'The first infinity stone to appear was the Space Stone',
    'Tony Stark is the richest Marvel character',
    'The most expensive marvel movie is The Age of Ultron',
    'Black Widow\'s real name is Natalia Alianovna Romanova',
    'MJ is played by Zendaya in the recent Spider-Man movies',
    'Captain America was frozen for 55 years',
    'Wakanda acquiresd vibranium from one of the infinity stones',
    'Nick Fury lost his eye, because it was scratched by a cat',
    'Groot has never said anything else apart from the phrase:“I am Groot”'
  ];

  List<bool> answers = [
    true,
    false,
    true,
    true,
    true,
    false,
    false,
    true,
    false
  ]; */

  List<Question> questionBank = [
    Question(
        q: 'The first infinity stone to appear was the Space Stone', a: true),
    Question(q: 'Tony Stark is the richest Marvel character', a: false),
    Question(
        q: 'The most expensive marvel movie is The Age of Ultron', a: true),
    Question(
        q: 'Black Widow\'s real name is Natalia Alianovna Romanova', a: true),
    Question(
        q: 'MJ is played by Zendaya in the recent Spider-Man movies', a: true),
    Question(q: 'Captain America was frozen for 55 years', a: false),
    Question(
        q: 'Wakanda acquiresd vibranium from one of the infinity stones',
        a: false),
    Question(
        q: 'Nick Fury lost his eye, because it was scratched by a cat',
        a: true),
    Question(
        q: 'Groot has never said anything else apart from the phrase:“I am Groot”',
        a: false)
  ];

  int questionNumber = 0;

  void correctAnswer() {
    bool correctAnswer = questionBank[questionNumber].questionAswer;
    if (correctAnswer == true) {
      rightAnswer += 1;
    } else {
      wrongAnswer += 1;
    }
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
                              Icons.check,
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
                    questionBank[questionNumber].questionText,
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
                          setState(() {
                            correctAnswer();
                            questionNumber++;
                          });
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
                          setState(() {
                            correctAnswer();
                            questionNumber++;
                          });
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
