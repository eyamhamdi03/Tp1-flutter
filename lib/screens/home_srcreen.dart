import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../models/book.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Liste de livres
    final books = [
      Book("Book 1", 100, 'assets/photo1.jpg'),
      Book("Book 2", 50, 'assets/photo2.jpg'),
      Book("Book 3", 50, 'assets/photo3.jpg'),
      Book("Book 4", 50, 'assets/photo4.jpg'),
      Book("Book 5", 50, 'assets/photo5.jpg'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 107, 235),
        title: const Text(
          "Store INSAT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Bienvenue sur Store INSAT !",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: books.length,
              itemBuilder: (context, index) {
                return ProductCard(book: books[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
