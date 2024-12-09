import 'package:flutter/material.dart';
import 'package:bi/widgets/left_drawer.dart';
import 'package:bi/widgets/mood_card.dart';
import 'package:bi/screens/moodentry_form.dart'; // Import MoodEntryFormPage

class MyHomePage extends StatelessWidget {
  final String npm = '2306256356';
  final String name = 'Heinrich';
  final String className = 'KKI';

  final List<ItemHomepage> items = const [
    ItemHomepage("View Products", Icons.shop),
    ItemHomepage("Add Product", Icons.add, color: Colors.blue),
    ItemHomepage("Logout", Icons.logout, color: Colors.red),
  ];

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bhat It',
          style: TextStyle(color: Colors.orange),
        ),
        backgroundColor: const Color(0xFF2A003A),
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
            const SizedBox(height: 16.0),
            const Center(
              child: Text(
                'Welcome to Bhat It',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.orange,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: items.map((ItemHomepage item) {
                  return ItemCard(item);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: const Color(0xFF2A003A),
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            const SizedBox(height: 8.0),
            Text(content, style: const TextStyle(color: Colors.orange)),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  const ItemHomepage(this.name, this.icon, {this.color = Colors.orange});
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF2A003A),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          if (item.name == "Add Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MoodEntryFormPage(), // Navigate to the form
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "You have pressed the ${item.name} button!",
                  style: const TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.orange,
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: item.color,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: item.color),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
