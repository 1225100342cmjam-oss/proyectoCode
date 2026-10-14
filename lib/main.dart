import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'tema.dart';

void main() => runApp(const CodeQuestApp());

class CodeQuestApp extends StatelessWidget {
  const CodeQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeQuest',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const SplashScreen(),
    );
  }
}