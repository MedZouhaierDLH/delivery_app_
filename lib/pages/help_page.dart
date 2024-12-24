import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Sample help topics and FAQs
  final List<Map<String, String>> _topics = [
    {
      'title': 'Account & Login',
      'content': 'How to reset password, account issues, etc.',
    },
    {
      'title': 'Orders & Deliveries',
      'content': 'Tracking orders, delivery issues, etc.',
    },
    {
      'title': 'Payments',
      'content': 'Payment methods, billing, etc.',
    },
  ];

  final List<Map<String, String>> _faqs = [
    {
      'question': 'How do I reset my password?',
      'answer': 'Go to settings > Reset Password, and follow the instructions.',
    },
    {
      'question': 'How can I change my email address?',
      'answer': 'Go to settings > Change Email, and enter your new email address.',
    },
    {
      'question': 'Where can I see my past orders?',
      'answer': 'You can view your past orders in the "Orders" section of the app.',
    },
    {
      'question': 'How can I contact support?',
      'answer': 'You can contact support by visiting the "Help" section and clicking "Contact Support".',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: HelpSearchDelegate(faqs: _faqs),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                controller: _searchController,
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search for help...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),

            // List of topics
            for (var topic in _topics)
              if (topic['title']!.toLowerCase().contains(_searchQuery.toLowerCase()))
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(topic['title']!),
                    subtitle: Text(topic['content']!),
                    onTap: () {
                      // Add a new page or section for each topic if needed
                      // For now, it will just show the FAQ section
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(topic['title']!),
                          content: Text(topic['content']!),
                          actions: [
                            TextButton(
                              child: const Text('Close'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

            // FAQs section
            const SizedBox(height: 20),
            const Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            for (var faq in _faqs)
              if (faq['question']!.toLowerCase().contains(_searchQuery.toLowerCase()))
                ExpansionTile(
                  title: Text(faq['question']!),
                  children: [Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(faq['answer']!),
                  )],
                ),

            // Contact support section
            const SizedBox(height: 40),
            const Text(
              'Contact Support',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'If you cannot find an answer to your issue, feel free to reach out to our support team.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement contact support logic (e.g., opening email, contact form)
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Contact Support'),
                    content: const Text('Support contact details or form goes here.'),
                    actions: [
                      TextButton(
                        child: const Text('Close'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Contact Support'),
            ),
          ],
        ),
      ),
    );
  }
}

class HelpSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> faqs;

  HelpSearchDelegate({required this.faqs});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search delegate
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = faqs
        .where((faq) => faq['question']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final faq = results[index];
        return ListTile(
          title: Text(faq['question']!),
          subtitle: Text(faq['answer']!),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(faq['question']!),
                content: Text(faq['answer']!),
                actions: [
                  TextButton(
                    child: const Text('Close'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = faqs
        .where((faq) => faq['question']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final faq = suggestions[index];
        return ListTile(
          title: Text(faq['question']!),
          subtitle: Text(faq['answer']!),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(faq['question']!),
                content: Text(faq['answer']!),
                actions: [
                  TextButton(
                    child: const Text('Close'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

