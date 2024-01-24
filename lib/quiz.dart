import 'package:flutter/material.dart';
import 'package:quiz_app/answers_button.dart';
import 'package:quiz_app/data/questions_screen.dart';
import 'package:quiz_app/logopage.dart';
import 'package:quiz_app/models/result_screen.dart';
import 'package:quiz_app/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'Start-Screen';
  void switchScreen() {
    setState(
      () {
        activeScreen = 'Questions-Screen';
      },
    );
  }

  void onrestart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'Question-Screen';
    });
  }

  void chooseAnswer(String answers) {
    selectedAnswers.add(answers);

    if (selectedAnswers.length == questions.length) {
      setState(
        () {
          activeScreen = 'result-Screen';
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = Logopage(switchScreen);
    if (activeScreen == 'Questions-Screen') {
      screenWidget = QuestionScreen(chooseAnswer);
    }
    if (activeScreen == 'result-Screen') {
      screenWidget = ResultScreen(
        selectedAnswers,
        onrestart,
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.deepPurple,
            Colors.deepPurpleAccent,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: screenWidget,
      ),
    );
  }
}
