import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainer_quiz/bloc/quiz_state.dart';
import 'package:trainer_quiz/data/quiz_data.dart';
import 'package:trainer_quiz/models/playstyle.dart';
import 'package:trainer_quiz/models/question.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizState.initial(_freshQuestions()));

  static List<Question> _freshQuestions() => quizQuestions
      .map((question) => question.copyWith(answer: null))
      .toList(growable: false);

  void startQuiz() {
    emit(state.copyWith(view: QuizView.quiz, currentIndex: 0));
  }

  void answerQuestion(int id, bool answer) {
    final updated = state.questions
        .map(
          (question) =>
              question.id == id ? question.copyWith(answer: answer) : question,
        )
        .toList(growable: false);
    emit(state.copyWith(questions: updated));
  }

  void goToQuestion(int index) {
    if (index < 0 || index >= state.questions.length) return;
    emit(state.copyWith(currentIndex: index));
  }

  void nextQuestion() {
    if (state.currentIndex >= state.questions.length - 1) return;
    goToQuestion(state.currentIndex + 1);
  }

  void previousQuestion() {
    if (state.currentIndex <= 0) return;
    goToQuestion(state.currentIndex - 1);
  }

  void resetQuiz() {
    final fresh = QuizState.initial(_freshQuestions());
    emit(fresh.copyWith(view: QuizView.quiz));
  }

  void calculateResults() {
    if (!state.allAnswered) return;

    final scores = {for (final type in TrainerType.values) type: 0};

    for (final question in state.questions) {
      if (question.answer == true) {
        trainerScoreMap.forEach((type, mapping) {
          if (mapping.contains(question.id)) {
            scores[type] = scores[type]! + 1;
          }
        });
      }
    }

    final dominant = scores.entries.reduce(
      (best, current) => current.value > best.value ? current : best,
    );

    emit(
      state.copyWith(
        scores: scores,
        dominantType: dominant.key,
        view: QuizView.results,
      ),
    );
  }
}
