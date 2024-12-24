import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platterpath2/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'feedback_page.dart'; // Import the FeedbackPage

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Dark Mode
          _buildSettingsItem(
            context,
            title: "Dark Mode",
            trailing: CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context, listen: true).isDarkMode,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
            ),
          ),
          const SizedBox(height: 10),

          // Language Selector
          _buildSettingsItem(
            context,
            title: "Language",
            trailing: DropdownButton<String>(
              value: "English",
              items: const [
                DropdownMenuItem(value: "English", child: Text("English")),
                DropdownMenuItem(value: "French", child: Text("French")),
                DropdownMenuItem(value: "Spanish", child: Text("Spanish")),
              ],
              onChanged: (value) {
                print("Language selected: $value");
              },
            ),
          ),
          const SizedBox(height: 10),

          // Notifications Toggle
          _buildSettingsItem(
            context,
            title: "Notifications",
            trailing: CupertinoSwitch(
              value: true, // Replace with a variable to manage state
              onChanged: (value) {
                print("Notifications toggled: $value");
              },
            ),
          ),
          const SizedBox(height: 10),

          // Submit Feedback Button
          _buildSettingsItem(
            context,
            title: "Submit Feedback",
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FeedbackPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context,
      {required String title, Widget? trailing, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }
}
