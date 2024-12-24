import 'package:flutter/material.dart';
import 'package:platterpath2/components/my_drawer_tile.dart';
import 'package:platterpath2/pages/favorites_page.dart';
import 'package:platterpath2/pages/help_page.dart';
import 'package:platterpath2/pages/settings_page.dart';
import 'package:platterpath2/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  final String email; // Add email parameter to the constructor

  const MyDrawer({super.key, required this.email});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // User Profile
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Theme.of(context).colorScheme.primary),
            ),
            accountName: Text(
              "----------------", // Placeholder for the user's name
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            accountEmail: Text(
              email, // Display the user's email dynamically
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // Home tile
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // Settings tile
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),

          // Favorites tile
          // Favorites tile
          MyDrawerTile(
            text: "F A V O R I T E S",
            icon: Icons.favorite,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesPage()),
              );
            },
          ),


          // Help tile
          MyDrawerTile(
            text: "H E L P",
            icon: Icons.help,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpPage()), // Navigate to HelpPage
              );
            },
          ),


          // Spacer
          const Spacer(),

          // Logout tile
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: () {
              logout();
            },
          ),

          // Footer
          Column(
            children: [
              Divider(color: Theme.of(context).colorScheme.secondary),
              Text(
                "",
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 12),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
