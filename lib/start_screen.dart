import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(
                157, 255, 255, 255), //Better approach for opacity
          ),
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 250,
          //   ),
          // ), //Performance intensive...
          const SizedBox(
            height: 80,
          ),
          const StyledText(
            text: "Learn Flutter the fun way",
            fontSize: 20,
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.purple),
                foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const StyledText(text: "Start Quiz", fontSize: 12),
          )
        ],
      ),
    );
  }
}
