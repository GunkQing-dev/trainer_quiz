import 'package:flutter/material.dart';
import 'package:trainer_quiz/quiz_page.dart';

void main() {
  runApp(const TrainerQuizApp());
}

class TrainerQuizApp extends StatelessWidget {
  const TrainerQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    final base = ThemeData.dark(useMaterial3: true);

    return MaterialApp(
      title: 'Find Your Trainer Type',
      debugShowCheckedModeBanner: false,
      theme: base.copyWith(
        colorScheme: base.colorScheme.copyWith(
          primary: const Color(0xFF9D4EDD),
          secondary: const Color(0xFF00BFA6),
        ),
        scaffoldBackgroundColor: const Color(0xFF12121C),
        textTheme: base.textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: const QuizPage(),
    );
  }
}
