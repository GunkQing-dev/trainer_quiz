import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trainer_quiz/bloc/quiz_cubit.dart';
import 'package:trainer_quiz/data/external_resources.dart';
import 'package:trainer_quiz/data/quiz_data.dart';
import 'package:trainer_quiz/models/playstyle.dart';
import 'package:trainer_quiz/widgets/answer_review_panel.dart';
import 'package:trainer_quiz/widgets/card_list_section.dart';
import 'package:trainer_quiz/widgets/external_resource_links.dart';
import 'package:trainer_quiz/widgets/score_bar.dart';
import 'package:trainer_quiz/utils/share_result_helper.dart';

class ResultSection extends StatefulWidget {
  const ResultSection({super.key});

  @override
  State<ResultSection> createState() => _ResultSectionState();
}

class _ResultSectionState extends State<ResultSection> {
  final GlobalKey _shareKey = GlobalKey();
  bool _isSharing = false;

  Future<void> _shareResults(TrainerType dominantType) async {
    if (_isSharing) return;
    setState(() => _isSharing = true);
    try {
      final boundary =
          _shareKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;
      if (boundary == null) return;
      final image = await boundary.toImage(pixelRatio: 3);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return;
      final pngBytes = byteData.buffer.asUint8List();
      // ignore: use_build_context_synchronously
      await shareResultImage(pngBytes, dominantType, context);
      if (!mounted) return;
    } catch (error) {
      debugPrint('Share error: $error');
    } finally {
      if (mounted) setState(() => _isSharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = context.watch<QuizCubit>().state;
    final dominant = state.dominantType;
    final dominantInfo = dominant != null ? playstyleLibrary[dominant] : null;

    final shareableContent = RepaintBoundary(
      key: _shareKey,
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
                    CardListSection(
                      title: 'Strengths',
                      items: dominantInfo.strengths,
                      icon: Icons.bolt,
                      iconColor: theme.colorScheme.secondary,
                    ),
                    const SizedBox(height: 16),
                    CardListSection(
                      title: 'Weaknesses',
                      items: dominantInfo.weaknesses,
                      icon: Icons.warning_rounded,
                      iconColor: Colors.orangeAccent,
                    ),
                    const SizedBox(height: 16),
                    CardListSection(
                      title: 'How to grow',
                      items: [dominantInfo.growthTip],
                      icon: Icons.auto_graph,
                      iconColor: theme.colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
          ] else ...[
            Text(
              'Answer each question to unlock your personalized breakdown.',
              style: theme.textTheme.titleMedium,
            ),
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
              child: ScoreBar(
                type: type,
                score: state.scores[type] ?? 0,
                total: trainerScoreMap[type]?.length ?? 0,
              ),
            ),
          ),
        ],
      ),
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          shareableContent,
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: dominant == null || _isSharing
                ? null
                : () => _shareResults(dominant),
            icon: _isSharing
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.share),
            label: Text(_isSharing ? 'Preparing...' : 'Share Results'),
          ),
          const SizedBox(height: 24),
          AnswerReviewPanel(questions: state.questions),
          const SizedBox(height: 24),
          const ExternalResourceLinks(
            title: 'Learn more and follow Dark Type Darsh',
            resources: darshFullResources,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => context.read<QuizCubit>().resetQuiz(),
            child: const Text('Retake Quiz'),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
