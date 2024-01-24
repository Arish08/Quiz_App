import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/models/questionsIdentifier.dart';

class summaryitem extends StatelessWidget {
  const summaryitem(this.itemdata, {super.key});

  final Map<String, Object> itemdata;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemdata['user_answers'] == itemdata['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        indexing(
          isCorrectAnswer,
          itemdata['question_index'] as int,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                itemdata['questions'] as String,
                style: GoogleFonts.lato(
                    color: Color.fromARGB(255, 255, 233, 233),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemdata['correct_answer'] as String,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 40, 255, 72),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemdata['user_answers'] as String,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 255, 102, 91),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        )
      ],
    );
  }
}
