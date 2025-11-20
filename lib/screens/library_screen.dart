import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/library_cell.dart';
import 'details_screen.dart';

class LibraryScreen extends StatefulWidget {
  static final List<Book> _books = [
    Book("Book 1", 100, 'assets/photo1.jpg'),
    Book("Book 2", 50, 'assets/photo2.jpg'),
    Book("Book 3", 50, 'assets/photo3.jpg'),
    Book("Book 4", 50, 'assets/photo4.jpg'),
    Book("Book 5", 50, 'assets/photo5.jpg'),
  ];

  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with AutomaticKeepAliveClientMixin<LibraryScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (final b in LibraryScreen._books) {
      precacheImage(AssetImage(b.image), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Library")),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 4,
        ),
        itemCount: LibraryScreen._books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsScreen(book: LibraryScreen._books[index]),
                ),
              );
            },
            child: LibraryCell(LibraryScreen._books[index]),
          );
        },
      ),
    );
  }
}
