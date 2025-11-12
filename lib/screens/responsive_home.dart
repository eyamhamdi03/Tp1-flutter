import 'package:flutter/material.dart';

class ResponsiveHome extends StatelessWidget {
  const ResponsiveHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Layout Demo')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Large screen
          if (constraints.maxWidth > 600) {
            return Row(
              children: [
                // Liste à gauche
                Container(
                  width: 250,
                  color: Colors.blue[50],
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) =>
                        ListTile(title: Text('Item $index')),
                  ),
                ),
                // Contenu détaillé à droite
                Expanded(
                  child: Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: Text(
                        'Select an item to see details',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          // Small screen
          else {
            return ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(index: index),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail of Item $index')),
      body: Center(
        child: Text(
          'Details for Item $index',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
