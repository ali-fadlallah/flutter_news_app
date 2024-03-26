import 'dart:ui';

class Category {
  String id;
  String title;
  String imagePath;
  Color backgroundColor;

  Category(this.id, this.title, this.imagePath, this.backgroundColor);

  static List<Category> getAllCategory() {
    return [
      Category('sports', 'Sports', 'sports.png', const Color(0xFFC91C22)),
      Category('health', 'Health', 'health.png', const Color(0xFFCF7E48)),
      Category('science', 'Science', 'science.png', const Color(0xFF4882CF)),
      Category('business', 'Business', 'business.png', const Color(0xFF003E90)),
      Category('technology', 'Technology', 'technology.png',
          const Color(0xFFF2D352)),
      Category('entertainment', 'Entertainment', 'entertainment.png',
          const Color(0xFFED1E79)),
    ];
  }
}
