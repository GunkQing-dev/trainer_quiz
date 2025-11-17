import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trainer_quiz/bloc/quiz_cubit.dart';
import 'package:trainer_quiz/widgets/quiz_view.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => QuizCubit(), child: const TrainerQuizView());
  }
}
