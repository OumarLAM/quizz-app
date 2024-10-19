import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../models/category.dart';
import 'detailed_view.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Text(
              'Quiz Categories',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryCard(category: categories[index], index: index);
              },
            ),
          ),
        ));
  }
}

class CategoryCard extends StatefulWidget {
  final Category category;
  final int index;

  const CategoryCard({super.key, required this.category, required this.index});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool _isTapped = false;

  Color _getCategoryColor() {
    switch (widget.index) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.purple;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.green;
      case 4:
        return Colors.red;
      case 5:
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) =>
          setState(() => _isTapped = true), 
      onTapUp: (_) =>
          setState(() => _isTapped = false), 
      onTapCancel: () => setState(() => _isTapped = false),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailedView(category: widget.category),
          ),
        );
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          transform: Matrix4.identity()
            ..scale(_isTapped ? 1.05 : 1.0), 
          child: Card(
            elevation: _isTapped ? 18 : 4,
            color: _getCategoryColor(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.category.imageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.category.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
