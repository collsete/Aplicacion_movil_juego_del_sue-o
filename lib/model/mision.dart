
class Item {
  final String title;
  final String description;
  final String imagePath;
  final double reward;
  bool isCompleted;

  Item({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.reward,
    required this.isCompleted, 
  });
  String get getTitle => title;
  String get getDescription => description;
  String get getImagePath => imagePath;
  bool get completed => isCompleted;
}