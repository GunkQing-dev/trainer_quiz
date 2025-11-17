import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trainer_quiz/bloc/quiz_cubit.dart';
import 'package:trainer_quiz/bloc/quiz_state.dart';
import 'package:trainer_quiz/widgets/intro_section.dart';
import 'package:trainer_quiz/widgets/quiz_section.dart';
import 'package:trainer_quiz/widgets/result_section.dart';
import 'package:trainer_quiz/widgets/top_contact_links.dart';

class TrainerQuizView extends StatelessWidget {
  const TrainerQuizView({super.key});

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const TopContactLinks(),
                      const SizedBox(height: 16),
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          child: switch (state.view) {
                            QuizView.intro => const IntroSection(),
                            QuizView.quiz => const QuizSection(),
                            QuizView.results => const ResultSection(),
                          },
                        ),
                      ),
                    ],
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
