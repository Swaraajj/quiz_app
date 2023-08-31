import 'package:flutter/material.dart';
import 'package:second_app/answer_button.dart';
import 'package:second_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuesScreen extends StatefulWidget {
  const QuesScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuesScreen> createState() {
    return _QuesScreenState();
  }
}

class _QuesScreenState extends State<QuesScreen> {
  var currQuesIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currQuesIndex++;
    });
  }

  @override
  Widget build(context) {
    final currQuestion = questions[currQuesIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currQuestion.text,
              style: GoogleFonts.robotoSlab(
                color: const Color.fromARGB(255, 234, 189, 248),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currQuestion.shuffledAnswers().map((answer) {
              return AnswerButton(
                answer,
                () {
                  answerQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
