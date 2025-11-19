import 'package:flutter/material.dart';
import 'package:tp1/screens/basket_screen.dart';
import 'package:tp1/screens/library_screen.dart';
import 'package:tp1/screens/auth/signup_page.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with TickerProviderStateMixin {
  late TabController tabController;

  final List<Widget> pages = [SignUpPage(), LibraryScreen(), BasketScreen()];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: pages.length, vsync: this);

    // Mettre à jour l'état quand l'onglet change
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        bottom: TabBar(
          controller: tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: const [
            Tab(icon: Icon(Icons.person_outline), text: "Sign Up"),
            Tab(icon: Icon(Icons.bookmark_outline), text: "Library"),
            Tab(icon: Icon(Icons.shopping_bag), text: "Basket"),
          ],
        ),
      ),
      body: TabBarView(controller: tabController, children: pages),
    );
  }
}
