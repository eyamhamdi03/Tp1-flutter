import 'package:flutter/material.dart';
import 'package:tp1/widgets/bottom_navBar.dart';
import 'package:tp1/widgets/custom_drawer.dart';
import 'package:tp1/widgets/tab_bar.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  bool useBottomNav = true;
  bool isLightTheme = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isLightTheme ? ThemeData.light() : ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: const Text("Navigation Example")),
        drawer: CustomDrawer(
          useBottomNav ? "Use Tabs Navigation" : "Use Bottom Navigation",
          const Icon(Icons.swap_horiz),
          () {
            setState(() {
              useBottomNav = !useBottomNav;
            });
            Navigator.pop(context);
          },
          isLightTheme: isLightTheme,
          onThemeToggle: () {
            setState(() {
              isLightTheme = !isLightTheme;
            });
          },
        ),
        body: useBottomNav ? const BottomNavBar() : const MyTabBar(),
      ),
    );
  }
}
