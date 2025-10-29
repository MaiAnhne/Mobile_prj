import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const LanguageFlashcardsApp());
}
// =================== APP ===================

class LanguageFlashcardsApp extends StatelessWidget {
  const LanguageFlashcardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Flashcards',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const SplashOrLogin(),
    );
  }
}