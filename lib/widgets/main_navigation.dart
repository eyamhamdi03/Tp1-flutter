import 'package:flutter/material.dart';
import 'package:tp1/widgets/bottom_navBar.dart';
import 'package:tp1/widgets/tab_bar.dart';

class MainNavigation extends StatefulWidget {
  final bool isLightTheme;
  final VoidCallback onThemeToggle;

  const MainNavigation({
    super.key,
    required this.isLightTheme,
    required this.onThemeToggle,
  });

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  bool useBottomNav = true;

  void toggleNavigationMode() {
    setState(() {
      useBottomNav = !useBottomNav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Store INSAT")),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            ListTile(
              leading: const Icon(Icons.swap_horiz),
              title: Text(
                useBottomNav ? "Use Tabs Navigation" : "Use Bottom Navigation",
              ),
              onTap: () {
                toggleNavigationMode();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.brightness_6),
              title: Text(
                widget.isLightTheme
                    ? "Switch to Dark Theme"
                    : "Switch to Light Theme",
              ),
              onTap: () {
                widget.onThemeToggle();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: useBottomNav ? const BottomNavBar() : const MyTabBar(),
    );
  }
}
