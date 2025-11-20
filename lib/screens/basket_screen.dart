import 'package:flutter/material.dart';
import 'package:tp1/models/book.dart';
import 'package:tp1/services/book_service.dart';
import 'package:tp1/widgets/home_cell.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen>
    with AutomaticKeepAliveClientMixin {
  List<Book>? _cachedBooks;
  bool _isLoading = false;

  @override
  bool get wantKeepAlive => true; // Keep alive to avoid reloading images

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    try {
      final books = await BookService().fetchBasketBooks();
      if (mounted) {
        setState(() {
          _cachedBooks = books;
          _isLoading = false;
        });
        // Precache images
        for (final book in books) {
          precacheImage(AssetImage(book.image), context);
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: _loadBooks,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading && _cachedBooks == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final books = _cachedBooks ?? [];

    if (books.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              "Your basket is empty",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Add some books to get started!",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return HomeCell(book: books[index]);
      },
    );
  }
}
