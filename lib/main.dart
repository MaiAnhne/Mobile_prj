import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const LanguageFlashcardsApp());
}
// APP 

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

//  MODELS 

class VocabItem {
  String id;
  String word;
  String meaning;
  String lang; // 'English' or 'Japanese'
  bool learned;

  VocabItem({
    required this.id,
    required this.word,
    required this.meaning,
    required this.lang,
    this.learned = false,
  });

  factory VocabItem.fromJson(Map<String, dynamic> j) => VocabItem(
        id: j['id'],
        word: j['word'],
        meaning: j['meaning'],
        lang: j['lang'],
        learned: j['learned'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'word': word,
        'meaning': meaning,
        'lang': lang,
        'learned': learned,
      };
}

// SPLASH / LOGIN ROUTE 

class SplashOrLogin extends StatefulWidget {
  const SplashOrLogin({super.key});

  @override
  State<SplashOrLogin> createState() => _SplashOrLoginState();
}

class _SplashOrLoginState extends State<SplashOrLogin> {
  String? _email;

  @override
  void initState() {
    super.initState();
    _checkLogged();
  }

  Future<void> _checkLogged() async {
    final e = await LocalStorage.getCurrentUser();
    // small delay for nicer transition
    await Future.delayed(const Duration(milliseconds: 400));
    if (e != null) {
      setState(() => _email = e);
      _goHome(e);
    } else {
      // go to Login
      if (mounted) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const AuthScreen()));
      }
    }
  }

  void _goHome(String email) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomeScreen(email: email)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeef6ff),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: const [
          Icon(Icons.flash_on_rounded, color: Colors.blueAccent, size: 80),
          SizedBox(height: 12),
          Text('Language Flashcards',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text('Offline demo', style: TextStyle(color: Colors.black54)),
        ]),
      ),
    );
  }
}