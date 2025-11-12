import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String buttonTitle;
  final Icon icon;
  final VoidCallback callback;
  final bool isLightTheme;
  final VoidCallback onThemeToggle;

  const CustomDrawer(
    this.buttonTitle,
    this.icon,
    this.callback, {
    super.key,
    required this.isLightTheme,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),

          ListTile(leading: icon, title: Text(buttonTitle), onTap: callback),
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: Text(
              isLightTheme ? "Switch to Dark Theme" : "Switch to Light Theme",
            ),
            onTap: () {
              onThemeToggle();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
