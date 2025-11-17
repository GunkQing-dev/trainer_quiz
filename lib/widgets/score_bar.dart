import 'package:flutter/material.dart';

import 'package:trainer_quiz/models/playstyle.dart';

class ScoreBar extends StatelessWidget {
  const ScoreBar({
    super.key,
    required this.type,
    required this.score,
    required this.total,
  });

  final TrainerType type;
  final int score;
  final int total;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = total == 0 ? 0.0 : score / total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              type.label,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$score / $total',
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
            valueColor: AlwaysStoppedAnimation<Color>(type.accentColor),
          ),
        ),
      ],
    );
  }
}
