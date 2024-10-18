import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/question.dart';
import 'score_view.dart';

class DetailedView extends StatefulWidget {
  final Category category;

  const DetailedView({super.key, required this.category});

  @override
  _DetailedViewState createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  void _answerQuestion(bool userAnswer) {
    setState(() {
      if (userAnswer == widget.category.questions[_currentQuestionIndex].answer) {
        _score++;
      }
      if (_currentQuestionIndex < widget.category.questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ScoreView(
              score: _score,
              totalQuestions: widget.category.questions.length,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = widget.category.questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.category.imageUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              currentQuestion.question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _answerQuestion(true),
                  child: const Text('True'),
                ),
                ElevatedButton(
                  onPressed: () => _answerQuestion(false),
                  child: const Text('False'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}