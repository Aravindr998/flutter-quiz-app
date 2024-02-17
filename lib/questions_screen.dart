import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onSelection, super.key});

  final void Function(String) onSelection;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentIndex = 0;
  void answerQuestion(String answer) {
    setState(
      () {
        widget.onSelection(answer);
        currentIndex++;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.shuffledList.map((item) {
              return AnswerButton(
                  text: item,
                  onPressed: () {
                    answerQuestion(item);
                  });
            })
          ],
        ),
      ),
    );
  }
}
