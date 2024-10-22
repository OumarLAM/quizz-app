import 'package:flutter/material.dart';
import 'dart:async';
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

class _DetailedViewState extends State<DetailedView>
    with SingleTickerProviderStateMixin {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _showFeedback = false;
  String _feedbackText = '';
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.2).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.elasticOut))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _answerQuestion(bool userAnswer) {
    bool isCorrect =
        userAnswer == widget.category.questions[_currentQuestionIndex].answer;
    _showAnswerFeedback(isCorrect);

    if (isCorrect) {
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
  }

  void _showAnswerFeedback(bool isCorrect) {
    setState(() {
      _showFeedback = true;
      _feedbackText = isCorrect ? 'BIIIM' : 'OOOPS';
    });
    _animationController.forward(from: 0);

    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _showFeedback = false;
      });
      _animationController.reset();
    });
  }

  Color _getCategoryColor() {
    switch (widget.index) {
      case 0:
        return Colors.blue.withOpacity(0.7);
      case 1:
        return Colors.purple.withOpacity(0.7);
      case 2:
        return Colors.orange.withOpacity(0.7);
      case 3:
        return Colors.green.withOpacity(0.7);
      case 4:
        return Colors.red.withOpacity(0.7);
      case 5:
        return Colors.teal.withOpacity(0.7);
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
        title: Text(
          widget.category.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: categoryColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value:
                (_currentQuestionIndex + 1) / widget.category.questions.length,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
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
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => _answerQuestion(true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
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
                              fontWeight: FontWeight.bold, fontSize: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
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
          if (_showFeedback)
            Center(
              child: AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: -0.785398,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Text(
                        _feedbackText,
                        style: TextStyle(
                          fontSize: 100,
                          color: _feedbackText == 'BIIIM'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
