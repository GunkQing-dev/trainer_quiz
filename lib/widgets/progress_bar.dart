import 'package:flutter/material.dart';

import 'package:trainer_quiz/bloc/quiz_state.dart';
import 'package:trainer_quiz/data/quiz_data.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.state});

  final QuizState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = state.answeredCount / totalQuestions;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Question ${state.currentIndex + 1} / $totalQuestions',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${state.answeredCount} / $totalQuestions answered',
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.white70,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 12,
            backgroundColor: const Color(0xFF2B2B3E),
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
