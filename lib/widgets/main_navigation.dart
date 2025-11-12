import 'package:flutter/material.dart';
import 'package:tp1/widgets/bottom_navBar.dart';
import 'package:tp1/widgets/customer_drawer.dart';
import 'package:tp1/widgets/tab_bar.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  bool useBottomNav = true; // true = BottomNav, false = TabBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        useBottomNav ? "Use Tabs Navigation" : "Use Bottom Navigation",
        const Icon(Icons.swap_horiz),
        () {
          setState(() {
            useBottomNav = !useBottomNav;
          });
          Navigator.pop(context); // ferme le drawer
        },
      ),
      body: useBottomNav ? const BottomNavBar() : const MyTabBar(),
    );
  }
}
