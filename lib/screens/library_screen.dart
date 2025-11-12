import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/library_cell.dart';
import 'details_screen.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          "Library",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 4,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(book: books[index]),
                ),
              );
            },
            child: LibraryCell(books[index]),
          );
        },
      ),
    );
  }
}
