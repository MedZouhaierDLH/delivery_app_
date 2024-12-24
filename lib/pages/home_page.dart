import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platterpath2/components/my_current_location.dart';
import 'package:platterpath2/components/my_description_box.dart';
import 'package:platterpath2/components/my_drawer.dart';
import 'package:platterpath2/components/my_food_tile.dart';
import 'package:platterpath2/components/my_sliver_app_bar.dart';
import 'package:platterpath2/components/my_tab_bar.dart';
import 'package:platterpath2/models/food.dart';
import 'package:platterpath2/models/restaurant.dart';
import 'package:platterpath2/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key, }); // Update constructor

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  // tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Method to get the logged-in user's email
  String? getUserEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.email; // Return the email of the current user
  }

  //sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category) {

      // get category Menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // get individual food
          final food = categoryMenu[index];

          //return food tile UI
          return FoodTile(
              food: food,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodPage(food: food),
                ),
              ),
          );
        },
      );
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    // Get the user's email
    String? userEmail = getUserEmail();

    return Scaffold(
      drawer: MyDrawer(email: userEmail ?? "Guest"), // Pass the email here
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                // Switch
                MyCurrentLocation(),

                // Description box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}
