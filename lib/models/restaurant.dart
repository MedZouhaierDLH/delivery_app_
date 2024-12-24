import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:platterpath2/models/cart_item.dart';
import 'package:platterpath2/models/food.dart';

class Restaurant extends ChangeNotifier{
  // List of food menu
  final List<Food> _menu = [
    // Burgers
    Food(
      name: "Classic Cheeseburger",
      description: "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "lib/images/burger/burger1.jpg",
      price: 9.8,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 1),
        Addon(name: "Bacon", price: 2),
        Addon(name: "Avocado", price: 2.5),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      description: "Smoky BBQ sauce, crispy bacon, cheddar cheese, and fried onion rings on a toasted bun.",
      imagePath: "lib/images/burger/burger2.jpg",
      price: 10.5,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra BBQ sauce", price: 0.5),
        Addon(name: "Grilled onions", price: 1),
      ],
    ),
    Food(
      name: "Mushroom Swiss Burger",
      description: "Sautéed mushrooms, Swiss cheese, and garlic aioli on a soft brioche bun.",
      imagePath: "lib/images/burger/burger3.jpg",
      price: 11.0,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra mushrooms", price: 1.5),
        Addon(name: "Gluten-free bun", price: 2),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description: "A savory vegetable patty topped with lettuce, tomato, pickles, and avocado on a whole wheat bun.",
      imagePath: "lib/images/burger/burger4.jpg",
      price: 8.0,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Vegan cheese", price: 1.5),
        Addon(name: "Grilled mushrooms", price: 1),
      ],
    ),
    Food(
      name: "Spicy Jalapeño Burger",
      description: "A beef patty with melted cheddar, spicy jalapeños, lettuce, and spicy mayo on a toasted bun.",
      imagePath: "lib/images/burger/burger5.jpg",
      price: 10.0,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra jalapeños", price: 1),
        Addon(name: "Spicy chipotle sauce", price: 0.5),
      ],
    ),
    Food(
      name: "Chicken Parmesan Burger",
      description: "Crispy chicken breast, marinara sauce, mozzarella cheese, and basil on a brioche bun.",
      imagePath: "lib/images/burger/burger6.jpg",
      price: 12.0,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra mozzarella", price: 1),
        Addon(name: "Garlic butter bun", price: 1),
      ],
    ),
    Food(
      name: "BBQ Chicken Burger",
      description: "Grilled chicken breast, smoky BBQ sauce, cheddar cheese, and crispy onions on a toasted bun.",
      imagePath: "lib/images/burger/burger7.jpg",
      price: 10.5,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra BBQ sauce", price: 0.5),
        Addon(name: "Grilled pineapple", price: 1),
      ],
    ),

    // Salads
    Food(
      name: "Caesar Salad",
      description: "Fresh romaine lettuce, croutons, and Parmesan cheese tossed in Caesar dressing.",
      imagePath: "lib/images/salads/salade1.jpg",
      price: 7.5,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 3),
        Addon(name: "Shrimp", price: 4),
      ],
    ),
    Food(
      name: "Greek Salad",
      description: "Crisp lettuce, tomatoes, cucumbers, red onions, Kalamata olives, and feta cheese with olive oil dressing.",
      imagePath: "lib/images/salads/salade2.jpg",
      price: 8.0,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra feta cheese", price: 1.5),
        Addon(name: "Pita bread", price: 1),
      ],
    ),
    Food(
      name: "Spinach and Strawberry Salad",
      description: "Fresh spinach, strawberries, goat cheese, and candied pecans with a balsamic vinaigrette.",
      imagePath: "lib/images/salads/salade3.jpg",
      price: 9.0,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled salmon", price: 5),
        Addon(name: "Toasted almonds", price: 1),
      ],
    ),
    Food(
      name: "Cobb Salad",
      description: "Mixed greens, grilled chicken, bacon, avocado, boiled egg, tomatoes, and blue cheese dressing.",
      imagePath: "lib/images/salads/salade4.jpg",
      price: 10.0,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra avocado", price: 1.5),
        Addon(name: "Extra bacon", price: 2),
      ],
    ),
    Food(
      name: "Caprese Salad",
      description: "Fresh mozzarella, tomatoes, basil, and balsamic glaze.",
      imagePath: "lib/images/salads/salade5.jpg",
      price: 8.5,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra mozzarella", price: 1),
        Addon(name: "Olive oil drizzle", price: 0.5),
      ],
    ),
    Food(
      name: "Quinoa Salad",
      description: "Quinoa, chickpeas, cucumbers, tomatoes, and a lemon vinaigrette.",
      imagePath: "lib/images/salads/salade6.jpg",
      price: 9.5,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 3),
        Addon(name: "Feta cheese", price: 1),
      ],
    ),
    Food(
      name: "Asian Sesame Salad",
      description: "Mixed greens, edamame, carrots, cucumbers, and sesame dressing.",
      imagePath: "lib/images/salads/salade7.jpg",
      price: 9.0,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled shrimp", price: 4),
        Addon(name: "Chopped almonds", price: 1),
      ],
    ),

    // Sides
    Food(
      name: "French Fries",
      description: "Crispy golden fries, lightly salted and perfect for dipping.",
      imagePath: "lib/images/sides/sides1.jpg",
      price: 3.5,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese sauce", price: 1),
        Addon(name: "Chili topping", price: 2),
      ],
    ),
    Food(
      name: "Sweet Potato Fries",
      description: "Lightly seasoned, crispy sweet potato fries served with a honey mustard dip.",
      imagePath: "lib/images/sides/sides2.jpg",
      price: 4.0,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Marshmallow dip", price: 1),
        Addon(name: "Cinnamon sugar sprinkle", price: 0.5),
      ],
    ),
    Food(
      name: "Onion Rings",
      description: "Thick-cut, crispy onion rings served with tangy ranch dressing.",
      imagePath: "lib/images/sides/sides3.jpg",
      price: 4.5,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Spicy dipping sauce", price: 1),
        Addon(name: "Extra crispy", price: 0.5),
      ],
    ),
    Food(
      name: "Mozzarella Sticks",
      description: "Crispy breaded mozzarella sticks served with marinara dipping sauce.",
      imagePath: "lib/images/sides/sides4.jpg",
      price: 5.0,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra marinara sauce", price: 0.5),
        Addon(name: "Ranch dip", price: 0.5),
      ],
    ),
    Food(
      name: "Garlic Bread",
      description: "Toasted bread with garlic butter, topped with Parmesan.",
      imagePath: "lib/images/sides/sides5.jpg",
      price: 3.0,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese topping", price: 1),
        Addon(name: "Herb drizzle", price: 0.5),
      ],
    ),
    Food(
      name: "Coleslaw",
      description: "Creamy coleslaw made with shredded cabbage and carrots.",
      imagePath: "lib/images/sides/sides6.jpg",
      price: 2.5,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra dressing", price: 0.5),
        Addon(name: "Chopped apples", price: 1),
      ],
    ),
    Food(
      name: "Baked Potato",
      description: "Baked potato served with butter, sour cream, and chives.",
      imagePath: "lib/images/sides/sides7.jpg",
      price: 3.5,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese", price: 1),
        Addon(name: "Bacon bits", price: 1.5),
      ],
    ),

    // Desserts
    Food(
      name: "Chocolate Lava Cake",
      description: "Warm, gooey chocolate cake with a molten center, served with vanilla ice cream.",
      imagePath: "lib/images/desserts/desserts1.jpg",
      price: 6.5,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra ice cream scoop", price: 2),
        Addon(name: "Caramel drizzle", price: 1),
      ],
    ),
    Food(
      name: "New York Cheesecake",
      description: "Creamy and rich cheesecake with a graham cracker crust, served with strawberry topping.",
      imagePath: "lib/images/desserts/desserts2.jpg",
      price: 7.0,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Whipped cream", price: 0.5),
        Addon(name: "Extra strawberry topping", price: 1),
      ],
    ),
    Food(
      name: "Apple Pie",
      description: "Warm apple pie with a flaky crust, served with a scoop of vanilla ice cream.",
      imagePath: "lib/images/desserts/desserts3.jpg",
      price: 5.5,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra ice cream scoop", price: 2),
        Addon(name: "Cinnamon sugar sprinkle", price: 0.5),
      ],
    ),
    Food(
      name: "Chocolate Chip Cookie",
      description: "Freshly baked chocolate chip cookie served warm with a glass of milk.",
      imagePath: "lib/images/desserts/desserts4.jpg",
      price: 3.0,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra chocolate chips", price: 1),
        Addon(name: "Glass of milk", price: 1.5),
      ],
    ),
    Food(
      name: "Tiramisu",
      description: "Layered espresso-soaked cake with mascarpone cream and cocoa powder.",
      imagePath: "lib/images/desserts/desserts5.jpg",
      price: 6.0,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra cocoa powder", price: 0.5),
        Addon(name: "Chocolate drizzle", price: 1),
      ],
    ),
    Food(
      name: "Panna Cotta",
      description: "Smooth Italian cream dessert with a berry compote topping.",
      imagePath: "lib/images/desserts/desserts6.jpg",
      price: 6.5,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra berry topping", price: 1),
        Addon(name: "Whipped cream", price: 0.5),
      ],
    ),
    Food(
      name: "Lemon Sorbet",
      description: "Refreshing lemon sorbet served chilled, perfect for cleansing the palate.",
      imagePath: "lib/images/desserts/desserts7.jpg",
      price: 4.5,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Mint leaves", price: 0.5),
        Addon(name: "Berry drizzle", price: 1),
      ],
    ),

    // Drinks
    Food(
      name: "Iced Coffee",
      description: "Freshly brewed coffee served over ice, lightly sweetened with milk or cream.",
      imagePath: "lib/images/drinks/drinks1.jpg",
      price: 4.5,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra shot of espresso", price: 1.5),
        Addon(name: "Flavored syrup (vanilla, caramel, hazelnut)", price: 0.5),
      ],
    ),
    Food(
      name: "Lemonade",
      description: "Freshly squeezed lemonade with just the right amount of sweetness.",
      imagePath: "lib/images/drinks/drinks2.jpg",
      price: 3.0,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Mint leaves", price: 0.5),
        Addon(name: "Sugar-free syrup", price: 0.5),
      ],
    ),
    Food(
      name: "Milkshake",
      description: "Thick and creamy milkshake available in chocolate, vanilla, or strawberry flavors.",
      imagePath: "lib/images/drinks/drinks3.jpg",
      price: 5.0,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Whipped cream", price: 1),
        Addon(name: "Extra flavor shot", price: 0.5),
      ],
    ),
    Food(
      name: "Iced Latte",
      description: "Espresso mixed with cold milk and ice, lightly sweetened.",
      imagePath: "lib/images/drinks/drinks4.jpg",
      price: 4.5,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra shot of espresso", price: 1.5),
        Addon(name: "Vanilla syrup", price: 0.5),
      ],
    ),
    Food(
      name: "Hot Chocolate",
      description: "Rich, creamy hot chocolate topped with whipped cream.",
      imagePath: "lib/images/drinks/drinks5.jpg",
      price: 4.0,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra whipped cream", price: 0.5),
        Addon(name: "Marshmallows", price: 0.5),
      ],
    ),
    Food(
      name: "Fruit Smoothie",
      description: "A blend of fresh fruits, yogurt, and a touch of honey.",
      imagePath: "lib/images/drinks/drinks6.jpg",
      price: 5.0,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Protein powder", price: 1.5),
        Addon(name: "Chia seeds", price: 0.5),
      ],
    ),
    Food(
      name: "Green Tea",
      description: "A refreshing and healthy green tea served hot.",
      imagePath: "lib/images/drinks/drinks7.jpg",
      price: 3.0,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Lemon slice", price: 0.5),
        Addon(name: "Honey", price: 0.5),
      ],
    ),
  ];

  String _deliveryAddress = "";





  // user cart
  final List<CartItem> _cart = [];
  List<Food> _favoriteFoods = [];
  // delivery address (which user can change/update)
  String _deliveryAdress = 'Ariana, Elghazela';


  /*

  G E T T E R S

   */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAdress => _deliveryAdress;



  /*

  O P E R A T I O N S

   */



  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;

    });

    // if item already exists, increase its quantity
    if(cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise, add new cart item
    else{
      _cart.add(
        CartItem(
            food: food,
            selectedAddons: selectedAddons
        ),
      );
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      }else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice() {
    double total =0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for(Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
}

  //get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // update delivery adress
  void updateDeliveryAdress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  // Get the list of favorite foods
  List<Food> get favoriteFoods => _favoriteFoods;

  // Toggle favorite for a food item
// Toggle favorite for a food item
  void toggleFavorite(Food food) {
    food.isFavorite = !food.isFavorite; // Toggle the isFavorite status

    if (food.isFavorite) {
      _favoriteFoods.add(food);
    } else {
      _favoriteFoods.remove(food);
    }

    notifyListeners();
  }

  /*
  H E L P E R S
 */

  //generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // format the date to include up to seconds
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("--------------------");

    for(final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("   Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("--------------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAdress");

    return receipt.toString();
  }


  //format double value into money
  String _formatPrice(double price) {
    return "${price.toStringAsFixed(2)}dt" ;
  }

  //format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})" )
        .join(", ");
  }

}
