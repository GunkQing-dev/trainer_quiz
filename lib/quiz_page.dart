import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainer_quiz/bloc/quiz_cubit.dart';
import 'package:trainer_quiz/bloc/quiz_state.dart';
import 'package:trainer_quiz/data/quiz_data.dart';
import 'package:trainer_quiz/models/playstyle.dart';
import 'package:trainer_quiz/widgets/question_card.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => QuizCubit(), child: const _QuizView());
  }
}

class _QuizView extends StatelessWidget {
  const _QuizView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: switch (state.view) {
                      QuizView.intro => _IntroSection(
                        key: const ValueKey('intro'),
                      ),
                      QuizView.quiz => _QuizSection(
                        key: const ValueKey('quiz'),
                      ),
                      QuizView.results => const _ResultSection(
                        key: ValueKey('results'),
                      ),
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _IntroSection extends StatelessWidget {
  const _IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
          '20-question VGC personality quiz inspired by Dark Type Darsh. '
          'Answer honestly to find out which archetype guides your play.',
          style: theme.textTheme.titleMedium?.copyWith(color: Colors.white70),
        ),
        const SizedBox(height: 32),
        FilledButton(
          onPressed: () => context.read<QuizCubit>().startQuiz(),
          child: const Text('Start Quiz'),
        ),
      ],
    );
  }
}

class _QuizSection extends StatelessWidget {
  const _QuizSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.watch<QuizCubit>();
    final state = cubit.state;
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
          _ProgressBar(state: state),
          const SizedBox(height: 32),
          QuestionCard(
            key: ValueKey(question.id),
            question: question,
            onAnswer: (answer) =>
                context.read<QuizCubit>().answerQuestion(question.id, answer),
          ),
          const SizedBox(height: 24),
          _QuestionNavigator(
            canGoBack: state.currentIndex > 0,
            canGoForward: state.currentIndex < totalQuestions - 1,
            canAdvance: question.answer != null,
            onBack: context.read<QuizCubit>().previousQuestion,
            onForward: context.read<QuizCubit>().nextQuestion,
          ),
          const SizedBox(height: 24),
          Align(
            child: FilledButton(
              onPressed: state.allAnswered
                  ? () => context.read<QuizCubit>().calculateResults()
                  : null,
              child: const Text('See Results'),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _ResultSection extends StatelessWidget {
  const _ResultSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = context.watch<QuizCubit>().state;
    final dominant = state.dominantType;
    final dominantInfo = dominant != null ? playstyleLibrary[dominant] : null;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Trainer Type',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          if (dominant != null && dominantInfo != null) ...[
            Text(
              dominantInfo.title,
              style: theme.textTheme.displaySmall?.copyWith(
                color: dominant.accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              dominant.tagline,
              style: theme.textTheme.titleLarge?.copyWith(
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 24),
            Card(
              color: const Color(0xFF1E1E2E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CardListSection(
                      title: 'Strengths',
                      items: dominantInfo.strengths,
                      icon: Icons.bolt,
                      iconColor: theme.colorScheme.secondary,
                    ),
                    const SizedBox(height: 16),
                    _CardListSection(
                      title: 'Weaknesses',
                      items: dominantInfo.weaknesses,
                      icon: Icons.warning_rounded,
                      iconColor: Colors.orangeAccent,
                    ),
                    const SizedBox(height: 16),
                    _CardListSection(
                      title: 'How to grow',
                      items: [dominantInfo.growthTip],
                      icon: Icons.auto_graph,
                      iconColor: theme.colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (dominant == null || dominantInfo == null) ...[
            Text(
              'Answer each question to unlock your personalized breakdown.',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 24),
          ],
          const SizedBox(height: 32),
          Text(
            'Scoreboard',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...TrainerType.values.map(
            (type) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _ScoreBar(
                type: type,
                score: state.scores[type] ?? 0,
                total: trainerScoreMap[type]?.length ?? 0,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              FilledButton(
                onPressed: () => context.read<QuizCubit>().resetQuiz(),
                child: const Text('Retake Quiz'),
              ),
              const SizedBox(width: 16),
              OutlinedButton(
                onPressed: () => context.read<QuizCubit>().startQuiz(),
                child: const Text('Review Answers'),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _CardListSection extends StatelessWidget {
  const _CardListSection({
    required this.title,
    required this.items,
    required this.icon,
    required this.iconColor,
  });

  final String title;
  final List<String> items;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 20, color: iconColor),
                const SizedBox(width: 8),
                Expanded(child: Text(item, style: theme.textTheme.titleMedium)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ScoreBar extends StatelessWidget {
  const _ScoreBar({
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

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.state});

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

class _QuestionNavigator extends StatelessWidget {
  const _QuestionNavigator({
    required this.canGoBack,
    required this.canGoForward,
    required this.canAdvance,
    required this.onBack,
    required this.onForward,
  });

  final bool canGoBack;
  final bool canGoForward;
  final bool canAdvance;
  final VoidCallback onBack;
  final VoidCallback onForward;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isForwardEnabled = canGoForward && canAdvance;
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
              backgroundColor: isForwardEnabled
                  ? theme.colorScheme.primary
                  : theme.colorScheme.primary.withValues(alpha: 0.4),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: isForwardEnabled ? onForward : null,
            icon: const Icon(Icons.chevron_right),
            label: Text(canGoForward ? 'Next Question' : 'Final Question'),
          ),
        ),
      ],
    );
  }
}
