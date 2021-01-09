import 'package:quizz_app/classes/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('The first infinity stone to appear was the Space Stone', true),
    Question('Tony Stark is the richest Marvel character', false),
    Question('The most expensive marvel movie is The Age of Ultron', true),
    Question('Black Widow\'s real name is Natalia Alianovna Romanova', true),
    Question('MJ is played by Zendaya in the recent Spider-Man movies', true),
    Question('Captain America was frozen for 55 years', false),
    Question(
        'Wakanda acquiresd vibranium from one of the infinity stones', false),
    Question('Nick Fury lost his eye, because it was scratched by a cat', true),
    Question(
        'Groot has never said anything else apart from the phrase:“I am Groot”',
        false)
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestions() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
