import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';

@freezed
sealed class Question with _$Question {
  const Question._();

  const factory Question({
    required int id,
    required String text,
    bool? answer,
  }) = _Question;
}
