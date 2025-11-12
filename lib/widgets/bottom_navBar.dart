import 'package:flutter/material.dart';
import 'package:tp1/screens/library_screen.dart';
import 'package:tp1/screens/basket_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> pages = [LibraryScreen(), LibraryScreen(), BasketScreen()];

  int mCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[mCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mCurrentIndex,
        onTap: (index) {
          setState(() {
            mCurrentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: "Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: "Basket",
          ),
        ],
      ),
    );
  }
}
