import 'package:flutter/material.dart';
import 'package:platterpath2/models/food.dart';
import 'package:platterpath2/models/restaurant.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch the favorite foods from the restaurant model
    List<Food> favoriteFoods = context.watch<Restaurant>().favoriteFoods;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text("Favorites"),
        centerTitle: true,
        elevation: 4.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality if needed
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Foreground content (List of favorite foods)
          favoriteFoods.isEmpty
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 10),
                const Text(
                  "No favorites yet",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
              : ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: favoriteFoods.length,
            itemBuilder: (context, index) {
              Food food = favoriteFoods[index];
              return Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      food.imagePath,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    food.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "${food.price}dt",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      // Remove from favorites if needed
                    },
                  ),
                  onTap: () {
                    // You can navigate to the food page or perform other actions
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
