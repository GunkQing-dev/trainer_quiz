import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trainer_quiz/bloc/quiz_cubit.dart';
import 'package:trainer_quiz/data/external_resources.dart';
import 'package:trainer_quiz/widgets/external_resource_links.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover Your Trainer Type',
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '20-question VGC personality quiz inspired by Dark Type Darsh. Answer honestly to find out which archetype guides your play.',
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 16),
          const ExternalResourceLinks(
            resources: darshIntroResources,
            maxItemWidth: 220,
          ),
          const SizedBox(height: 32),
          FilledButton(
            onPressed: () => context.read<QuizCubit>().startQuiz(),
            child: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
