import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions_screen.dart';
import 'package:quiz_app/logopage.dart';
import 'package:quiz_app/models/Summary_data.dart';
import 'package:quiz_app/quiz.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswers, this.onrestart, {super.key});

  final List<String> chosenAnswers;
  final void Function() onrestart;

  List<Map<String, Object>> getsummarydata() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'questions': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answers': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getsummarydata();
    final totalquestions = questions.length;
    final correctanswers = summary.where((data) {
      return data['correct_answer'] == data['user_answers'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctanswers out of $totalquestions questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summary),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              icon: const Icon(
                Icons.restart_alt_outlined,
                color: Colors.white,
              ),
              onPressed: onrestart,
              label: const Text(
                'Restart Quiz',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
