import 'package:flutter/material.dart';
import 'package:tp1/widgets/main_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLightTheme = true;

  void toggleTheme() {
    setState(() {
      isLightTheme = !isLightTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isLightTheme ? ThemeMode.light : ThemeMode.dark,
      home: MainNavigation(
        isLightTheme: isLightTheme,
        onThemeToggle: toggleTheme,
      ),
    );
  }
}
