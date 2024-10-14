import 'question.dart';

class Category {
  String name;
  String imageUrl;
  List<Question> questions;

  Category(this.name, this.imageUrl, this.questions);
}
