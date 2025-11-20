import 'package:flutter/material.dart';
import 'package:tp1/screens/basket_screen.dart';
import 'package:tp1/screens/library_screen.dart';
import 'package:tp1/screens/auth/signup_page.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Theme.of(context).colorScheme.primary,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(icon: Icon(Icons.person_outline), text: "Sign Up"),
              Tab(icon: Icon(Icons.bookmark_outline), text: "Library"),
              Tab(icon: Icon(Icons.shopping_bag), text: "Basket"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [SignUpPage(), LibraryScreen(), BasketScreen()],
        ),
      ),
    );
  }
}
