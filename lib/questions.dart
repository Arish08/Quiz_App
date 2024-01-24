import 'package:flutter/material.dart';
import 'package:quiz_app/answers_button.dart';
import 'package:quiz_app/data/questions_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentquestionIndex = 0;

  void changequestion(String selectanswer) {
    widget.onSelectAnswer(selectanswer);
    setState(
      () {
        currentquestionIndex++;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var currentquestion = questions[currentquestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentquestion.getshuffled().map(
              (answers) {
                return Answers(
                  answers,
                  () {
                    changequestion(answers);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
