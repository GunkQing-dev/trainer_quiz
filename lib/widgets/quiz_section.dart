import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trainer_quiz/bloc/quiz_cubit.dart';
import 'package:trainer_quiz/bloc/quiz_state.dart';
import 'package:trainer_quiz/data/quiz_data.dart';
import 'package:trainer_quiz/widgets/progress_bar.dart';
import 'package:trainer_quiz/widgets/question_card.dart';
import 'package:trainer_quiz/widgets/question_navigator.dart';

class QuizSection extends StatelessWidget {
  const QuizSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = context.watch<QuizCubit>().state;
    final question = state.currentQuestion;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover Your Trainer Type',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '20-question VGC personality quiz inspired by Dark Type Darsh.',
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 24),
          ProgressBar(state: state),
          const SizedBox(height: 32),
          QuestionCard(
            key: ValueKey(question.id),
            question: question,
            onAnswer: (answer) =>
                context.read<QuizCubit>().answerQuestion(question.id, answer),
          ),
          const SizedBox(height: 24),
          QuestionNavigator(
            canGoBack: state.currentIndex > 0,
            canGoForward: state.currentIndex < totalQuestions - 1,
            canAdvance: question.answer != null,
            isFinalQuestion: state.currentIndex == totalQuestions - 1,
            onBack: context.read<QuizCubit>().previousQuestion,
            onForward: context.read<QuizCubit>().nextQuestion,
            onShowResults: () => context.read<QuizCubit>().calculateResults(),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
