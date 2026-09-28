// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Load value)?  load,TResult Function( RefreshUserInfo value)?  refreshUserInfo,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Load() when load != null:
return load(_that);case RefreshUserInfo() when refreshUserInfo != null:
return refreshUserInfo(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Load value)  load,required TResult Function( RefreshUserInfo value)  refreshUserInfo,}){
final _that = this;
switch (_that) {
case Load():
return load(_that);case RefreshUserInfo():
return refreshUserInfo(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Load value)?  load,TResult? Function( RefreshUserInfo value)?  refreshUserInfo,}){
final _that = this;
switch (_that) {
case Load() when load != null:
return load(_that);case RefreshUserInfo() when refreshUserInfo != null:
return refreshUserInfo(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function()?  refreshUserInfo,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Load() when load != null:
return load();case RefreshUserInfo() when refreshUserInfo != null:
return refreshUserInfo();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function()  refreshUserInfo,}) {final _that = this;
switch (_that) {
case Load():
return load();case RefreshUserInfo():
return refreshUserInfo();case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function()?  refreshUserInfo,}) {final _that = this;
switch (_that) {
case Load() when load != null:
return load();case RefreshUserInfo() when refreshUserInfo != null:
return refreshUserInfo();case _:
  return null;

}
}

}

/// @nodoc


class Load implements ProfileEvent {
  const Load();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProfileEvent.load()';
}


}




/// @nodoc


class RefreshUserInfo implements ProfileEvent {
  const RefreshUserInfo();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshUserInfo);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProfileEvent.refreshUserInfo()';
}


}




// dart format on
