//food item
class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  final List<Addon> availableAddons;
  bool isFavorite;  // Add this property

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.availableAddons,
    required this.category,
    this.isFavorite = false, // Initialize as false
  });
}


// food categories
enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}


// food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price
});
}