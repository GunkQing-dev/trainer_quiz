import 'package:flutter/material.dart';

class QuestionNavigator extends StatelessWidget {
  const QuestionNavigator({
    super.key,
    required this.canGoBack,
    required this.canGoForward,
    required this.canAdvance,
    required this.isFinalQuestion,
    required this.onBack,
    required this.onForward,
    required this.onShowResults,
  });

  final bool canGoBack;
  final bool canGoForward;
  final bool canAdvance;
  final bool isFinalQuestion;
  final VoidCallback onBack;
  final VoidCallback onForward;
  final VoidCallback onShowResults;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        OutlinedButton.icon(
          onPressed: canGoBack ? onBack : null,
          icon: const Icon(Icons.chevron_left),
          label: const Text('Previous'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: canAdvance
                  ? theme.colorScheme.primary
                  : theme.colorScheme.primary.withValues(alpha: 0.4),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: canAdvance
                ? (isFinalQuestion ? onShowResults : onForward)
                : null,
            icon: Icon(isFinalQuestion ? Icons.flag : Icons.chevron_right),
            label: Text(isFinalQuestion ? 'Show Results' : 'Next Question'),
          ),
        ),
      ],
    );
  }
}
