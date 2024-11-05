import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String npm = '2306256356'; // NPM
  final String name = 'Heinrich'; // Name
  final String className = 'KKI'; // Class

  const MyHomePage({super.key});

  final List<ItemHomepage> items = const [
    ItemHomepage("View Products", Icons.shop), // Default color
    ItemHomepage("Add Product", Icons.add, color: Colors.blue), // Dark blue
    ItemHomepage("Logout", Icons.logout, color: Colors.red), // Dark red
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bhat It', style: TextStyle(color: Colors.orange)), // Orange text
        backgroundColor: Color(0xFF2A003A), // Darker purple for AppBar
      ),
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
            const Text(
              'Welcome to Bhat It', // Title remains unchanged
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.orange, // Orange text color
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
      color: Color(0xFF2A003A), // Darker purple for InfoCard
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orange), // Orange text
            ),
            const SizedBox(height: 8.0),
            Text(content, style: const TextStyle(color: Colors.orange)), // Orange text
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

  const ItemHomepage(this.name, this.icon, {this.color = Colors.orange}); // Default color

}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF2A003A), // Darker purple for buttons
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("You have pressed the ${item.name} button!", style: const TextStyle(color: Colors.orange))), // Orange text
          );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: item.color, // Set icon color based on item
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: item.color), // Set text color based on item
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
