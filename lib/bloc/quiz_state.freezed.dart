// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizState {

 List<Question> get questions; QuizView get view; Map<TrainerType, int> get scores; int get currentIndex; TrainerType? get dominantType;
/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizStateCopyWith<QuizState> get copyWith => _$QuizStateCopyWithImpl<QuizState>(this as QuizState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizState&&const DeepCollectionEquality().equals(other.questions, questions)&&(identical(other.view, view) || other.view == view)&&const DeepCollectionEquality().equals(other.scores, scores)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.dominantType, dominantType) || other.dominantType == dominantType));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(questions),view,const DeepCollectionEquality().hash(scores),currentIndex,dominantType);

@override
String toString() {
  return 'QuizState(questions: $questions, view: $view, scores: $scores, currentIndex: $currentIndex, dominantType: $dominantType)';
}


}

/// @nodoc
abstract mixin class $QuizStateCopyWith<$Res>  {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) _then) = _$QuizStateCopyWithImpl;
@useResult
$Res call({
 List<Question> questions, QuizView view, Map<TrainerType, int> scores, int currentIndex, TrainerType? dominantType
});




}
/// @nodoc
class _$QuizStateCopyWithImpl<$Res>
    implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._self, this._then);

  final QuizState _self;
  final $Res Function(QuizState) _then;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questions = null,Object? view = null,Object? scores = null,Object? currentIndex = null,Object? dominantType = freezed,}) {
  return _then(_self.copyWith(
questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as QuizView,scores: null == scores ? _self.scores : scores // ignore: cast_nullable_to_non_nullable
as Map<TrainerType, int>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,dominantType: freezed == dominantType ? _self.dominantType : dominantType // ignore: cast_nullable_to_non_nullable
as TrainerType?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizState].
extension QuizStatePatterns on QuizState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizState value)  $default,){
final _that = this;
switch (_that) {
case _QuizState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizState value)?  $default,){
final _that = this;
switch (_that) {
case _QuizState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Question> questions,  QuizView view,  Map<TrainerType, int> scores,  int currentIndex,  TrainerType? dominantType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizState() when $default != null:
return $default(_that.questions,_that.view,_that.scores,_that.currentIndex,_that.dominantType);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Question> questions,  QuizView view,  Map<TrainerType, int> scores,  int currentIndex,  TrainerType? dominantType)  $default,) {final _that = this;
switch (_that) {
case _QuizState():
return $default(_that.questions,_that.view,_that.scores,_that.currentIndex,_that.dominantType);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Question> questions,  QuizView view,  Map<TrainerType, int> scores,  int currentIndex,  TrainerType? dominantType)?  $default,) {final _that = this;
switch (_that) {
case _QuizState() when $default != null:
return $default(_that.questions,_that.view,_that.scores,_that.currentIndex,_that.dominantType);case _:
  return null;

}
}

}

/// @nodoc


class _QuizState extends QuizState {
  const _QuizState({required final  List<Question> questions, required this.view, required final  Map<TrainerType, int> scores, required this.currentIndex, this.dominantType}): _questions = questions,_scores = scores,super._();
  

 final  List<Question> _questions;
@override List<Question> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

@override final  QuizView view;
 final  Map<TrainerType, int> _scores;
@override Map<TrainerType, int> get scores {
  if (_scores is EqualUnmodifiableMapView) return _scores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_scores);
}

@override final  int currentIndex;
@override final  TrainerType? dominantType;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizStateCopyWith<_QuizState> get copyWith => __$QuizStateCopyWithImpl<_QuizState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizState&&const DeepCollectionEquality().equals(other._questions, _questions)&&(identical(other.view, view) || other.view == view)&&const DeepCollectionEquality().equals(other._scores, _scores)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.dominantType, dominantType) || other.dominantType == dominantType));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_questions),view,const DeepCollectionEquality().hash(_scores),currentIndex,dominantType);

@override
String toString() {
  return 'QuizState(questions: $questions, view: $view, scores: $scores, currentIndex: $currentIndex, dominantType: $dominantType)';
}


}

/// @nodoc
abstract mixin class _$QuizStateCopyWith<$Res> implements $QuizStateCopyWith<$Res> {
  factory _$QuizStateCopyWith(_QuizState value, $Res Function(_QuizState) _then) = __$QuizStateCopyWithImpl;
@override @useResult
$Res call({
 List<Question> questions, QuizView view, Map<TrainerType, int> scores, int currentIndex, TrainerType? dominantType
});




}
/// @nodoc
class __$QuizStateCopyWithImpl<$Res>
    implements _$QuizStateCopyWith<$Res> {
  __$QuizStateCopyWithImpl(this._self, this._then);

  final _QuizState _self;
  final $Res Function(_QuizState) _then;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questions = null,Object? view = null,Object? scores = null,Object? currentIndex = null,Object? dominantType = freezed,}) {
  return _then(_QuizState(
questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as QuizView,scores: null == scores ? _self._scores : scores // ignore: cast_nullable_to_non_nullable
as Map<TrainerType, int>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,dominantType: freezed == dominantType ? _self.dominantType : dominantType // ignore: cast_nullable_to_non_nullable
as TrainerType?,
  ));
}


}

// dart format on
