import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String buttonTitle;
  final Icon icon;
  final VoidCallback callback;

  const CustomDrawer(this.buttonTitle, this.icon, this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Image.asset("assets/insat.jpg", width: 100),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: icon,
              title: Text(buttonTitle),
              onTap: callback,
            ),
          ),
        ],
      ),
    );
  }
}
