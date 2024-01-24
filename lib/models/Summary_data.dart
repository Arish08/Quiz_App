import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summarydata, {super.key});

  List<Map<String, Object>> summarydata;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
            children: summarydata.map(
          (data) {
            return summaryitem(data);
          },
        ).toList()),
      ),
    );
  }
}
