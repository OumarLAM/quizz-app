import 'package:flutter/material.dart';
import 'categories_page.dart';

class ScoreView extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ScoreView({required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '$score / $totalQuestions',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => CategoriesPage()),
                  (route) => false,
                );
              },
              child: Text('Back to Categories'),
            ),
          ],
        ),
      ),
    );
  }
}