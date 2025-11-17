// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playstyle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlaystyleInfo {

 String get title; String get subtitle; List<String> get strengths; List<String> get weaknesses; String get growthTip;
/// Create a copy of PlaystyleInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaystyleInfoCopyWith<PlaystyleInfo> get copyWith => _$PlaystyleInfoCopyWithImpl<PlaystyleInfo>(this as PlaystyleInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaystyleInfo&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other.strengths, strengths)&&const DeepCollectionEquality().equals(other.weaknesses, weaknesses)&&(identical(other.growthTip, growthTip) || other.growthTip == growthTip));
}


@override
int get hashCode => Object.hash(runtimeType,title,subtitle,const DeepCollectionEquality().hash(strengths),const DeepCollectionEquality().hash(weaknesses),growthTip);

@override
String toString() {
  return 'PlaystyleInfo(title: $title, subtitle: $subtitle, strengths: $strengths, weaknesses: $weaknesses, growthTip: $growthTip)';
}


}

/// @nodoc
abstract mixin class $PlaystyleInfoCopyWith<$Res>  {
  factory $PlaystyleInfoCopyWith(PlaystyleInfo value, $Res Function(PlaystyleInfo) _then) = _$PlaystyleInfoCopyWithImpl;
@useResult
$Res call({
 String title, String subtitle, List<String> strengths, List<String> weaknesses, String growthTip
});




}
/// @nodoc
class _$PlaystyleInfoCopyWithImpl<$Res>
    implements $PlaystyleInfoCopyWith<$Res> {
  _$PlaystyleInfoCopyWithImpl(this._self, this._then);

  final PlaystyleInfo _self;
  final $Res Function(PlaystyleInfo) _then;

/// Create a copy of PlaystyleInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? subtitle = null,Object? strengths = null,Object? weaknesses = null,Object? growthTip = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,strengths: null == strengths ? _self.strengths : strengths // ignore: cast_nullable_to_non_nullable
as List<String>,weaknesses: null == weaknesses ? _self.weaknesses : weaknesses // ignore: cast_nullable_to_non_nullable
as List<String>,growthTip: null == growthTip ? _self.growthTip : growthTip // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaystyleInfo].
extension PlaystyleInfoPatterns on PlaystyleInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaystyleInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaystyleInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaystyleInfo value)  $default,){
final _that = this;
switch (_that) {
case _PlaystyleInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaystyleInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PlaystyleInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String subtitle,  List<String> strengths,  List<String> weaknesses,  String growthTip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaystyleInfo() when $default != null:
return $default(_that.title,_that.subtitle,_that.strengths,_that.weaknesses,_that.growthTip);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String subtitle,  List<String> strengths,  List<String> weaknesses,  String growthTip)  $default,) {final _that = this;
switch (_that) {
case _PlaystyleInfo():
return $default(_that.title,_that.subtitle,_that.strengths,_that.weaknesses,_that.growthTip);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String subtitle,  List<String> strengths,  List<String> weaknesses,  String growthTip)?  $default,) {final _that = this;
switch (_that) {
case _PlaystyleInfo() when $default != null:
return $default(_that.title,_that.subtitle,_that.strengths,_that.weaknesses,_that.growthTip);case _:
  return null;

}
}

}

/// @nodoc


class _PlaystyleInfo extends PlaystyleInfo {
  const _PlaystyleInfo({required this.title, required this.subtitle, required final  List<String> strengths, required final  List<String> weaknesses, required this.growthTip}): _strengths = strengths,_weaknesses = weaknesses,super._();
  

@override final  String title;
@override final  String subtitle;
 final  List<String> _strengths;
@override List<String> get strengths {
  if (_strengths is EqualUnmodifiableListView) return _strengths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_strengths);
}

 final  List<String> _weaknesses;
@override List<String> get weaknesses {
  if (_weaknesses is EqualUnmodifiableListView) return _weaknesses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weaknesses);
}

@override final  String growthTip;

/// Create a copy of PlaystyleInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaystyleInfoCopyWith<_PlaystyleInfo> get copyWith => __$PlaystyleInfoCopyWithImpl<_PlaystyleInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaystyleInfo&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other._strengths, _strengths)&&const DeepCollectionEquality().equals(other._weaknesses, _weaknesses)&&(identical(other.growthTip, growthTip) || other.growthTip == growthTip));
}


@override
int get hashCode => Object.hash(runtimeType,title,subtitle,const DeepCollectionEquality().hash(_strengths),const DeepCollectionEquality().hash(_weaknesses),growthTip);

@override
String toString() {
  return 'PlaystyleInfo(title: $title, subtitle: $subtitle, strengths: $strengths, weaknesses: $weaknesses, growthTip: $growthTip)';
}


}

/// @nodoc
abstract mixin class _$PlaystyleInfoCopyWith<$Res> implements $PlaystyleInfoCopyWith<$Res> {
  factory _$PlaystyleInfoCopyWith(_PlaystyleInfo value, $Res Function(_PlaystyleInfo) _then) = __$PlaystyleInfoCopyWithImpl;
@override @useResult
$Res call({
 String title, String subtitle, List<String> strengths, List<String> weaknesses, String growthTip
});




}
/// @nodoc
class __$PlaystyleInfoCopyWithImpl<$Res>
    implements _$PlaystyleInfoCopyWith<$Res> {
  __$PlaystyleInfoCopyWithImpl(this._self, this._then);

  final _PlaystyleInfo _self;
  final $Res Function(_PlaystyleInfo) _then;

/// Create a copy of PlaystyleInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subtitle = null,Object? strengths = null,Object? weaknesses = null,Object? growthTip = null,}) {
  return _then(_PlaystyleInfo(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,strengths: null == strengths ? _self._strengths : strengths // ignore: cast_nullable_to_non_nullable
as List<String>,weaknesses: null == weaknesses ? _self._weaknesses : weaknesses // ignore: cast_nullable_to_non_nullable
as List<String>,growthTip: null == growthTip ? _self.growthTip : growthTip // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
