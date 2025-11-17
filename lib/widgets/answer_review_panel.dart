import 'package:flutter/material.dart';

import 'package:trainer_quiz/models/question.dart';

class AnswerReviewPanel extends StatelessWidget {
  const AnswerReviewPanel({super.key, required this.questions});

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: const Color(0xFF1E1E2E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.white12),
        child: ExpansionTile(
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          collapsedIconColor: Colors.white70,
          iconColor: theme.colorScheme.primary,
          title: Text(
            'Review Answers',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Expand to see every question and your response.',
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70),
          ),
          children: questions
              .map(
                (question) => ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 4,
                  ),
                  title: Text(
                    '${question.id}. ${question.text}',
                    style: theme.textTheme.bodyLarge,
                  ),
                  trailing: Text(
                    _answerLabel(question.answer),
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: _answerColor(context, question.answer),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  String _answerLabel(bool? answer) {
    if (answer == true) return 'YES';
    if (answer == false) return 'NO';
    return 'Unanswered';
  }

  Color _answerColor(BuildContext context, bool? answer) {
    if (answer == true) {
      return Theme.of(context).colorScheme.primary;
    }
    if (answer == false) {
      return Colors.redAccent;
    }
    return Colors.white70;
  }
}
