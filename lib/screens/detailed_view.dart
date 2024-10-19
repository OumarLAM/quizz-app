import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/question.dart';
import 'score_view.dart';

class DetailedView extends StatefulWidget {
  final Category category;
  final int index;

  const DetailedView({super.key, required this.category, required this.index});

  @override
  _DetailedViewState createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  void _answerQuestion(bool userAnswer) {
    setState(() {
      if (userAnswer ==
          widget.category.questions[_currentQuestionIndex].answer) {
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

  Color _getCategoryColor() {
    switch (widget.index) {
      case 0:
        return Colors.blue.withOpacity(0.7); // Films
      case 1:
        return Colors.purple.withOpacity(0.7); // Music
      case 2:
        return Colors.orange.withOpacity(0.7); // History
      case 3:
        return Colors.green.withOpacity(0.7); // Math
      case 4:
        return Colors.red.withOpacity(0.7); // Football
      case 5:
        return Colors.teal.withOpacity(0.7); // Geography
      default:
        return Colors.grey.withOpacity(0.7);
    }
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = widget.category.questions[_currentQuestionIndex];
    Color categoryColor = _getCategoryColor();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        backgroundColor: categoryColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value: (_currentQuestionIndex + 1) / widget.category.questions.length,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: categoryColor.withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                widget.category.imageUrl,
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                currentQuestion.question,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _answerQuestion(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('True'),
                  ),
                  ElevatedButton(
                    onPressed: () => _answerQuestion(false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('False'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
