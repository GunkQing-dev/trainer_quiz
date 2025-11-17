import 'package:flutter/material.dart';
import 'package:trainer_quiz/models/question.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
    required this.onAnswer,
  });

  final Question question;
  final ValueChanged<bool> onAnswer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: const Color(0xFF1E1E2E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${question.id.toString().padLeft(2, '0')}',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              question.text,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              children: [
                ChoiceChip(
                  label: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text('YES'),
                  ),
                  selected: question.answer == true,
                  onSelected: (_) => onAnswer(true),
                  selectedColor: theme.colorScheme.primary.withValues(
                    alpha: 0.25,
                  ),
                  labelStyle: theme.textTheme.labelLarge?.copyWith(
                    color: question.answer == true
                        ? theme.colorScheme.primary
                        : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: const Color(0xFF2A2A3D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                ChoiceChip(
                  label: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text('NO'),
                  ),
                  selected: question.answer == false,
                  onSelected: (_) => onAnswer(false),
                  selectedColor: Colors.redAccent.withValues(alpha: 0.25),
                  labelStyle: theme.textTheme.labelLarge?.copyWith(
                    color: question.answer == false
                        ? Colors.redAccent
                        : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: const Color(0xFF2A2A3D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
