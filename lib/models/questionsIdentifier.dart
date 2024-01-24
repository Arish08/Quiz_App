import 'package:flutter/material.dart';

class indexing extends StatelessWidget {
  const indexing(this.iscorrectanswer, this.questionindex, {super.key});

  final bool iscorrectanswer;
  final int questionindex;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionindex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: iscorrectanswer
            ? const Color.fromARGB(255, 150, 198, 241)
            : const Color.fromARGB(255, 249, 133, 241),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(questionNumber.toString()),
    );
  }
}
