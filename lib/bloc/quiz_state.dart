import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trainer_quiz/models/playstyle.dart';
import 'package:trainer_quiz/models/question.dart';

part 'quiz_state.freezed.dart';

enum QuizView { intro, quiz, results }

@freezed
sealed class QuizState with _$QuizState {
  const QuizState._();

  const factory QuizState({
    required List<Question> questions,
    required QuizView view,
    required Map<TrainerType, int> scores,
    required int currentIndex,
    TrainerType? dominantType,
  }) = _QuizState;

  factory QuizState.initial(List<Question> questions) => QuizState(
    questions: questions,
    view: QuizView.intro,
    scores: {for (final type in TrainerType.values) type: 0},
    currentIndex: 0,
  );
}

extension QuizStateX on QuizState {
  int get answeredCount =>
      questions.where((question) => question.answer != null).length;

  bool get allAnswered => answeredCount == questions.length;

  Question get currentQuestion => questions[currentIndex];
}
