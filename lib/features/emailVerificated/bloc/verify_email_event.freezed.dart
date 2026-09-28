// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_email_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyEmailEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'VerifyEmailEvent'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'VerifyEmailEvent()';
}


}

/// @nodoc
class $VerifyEmailEventCopyWith<$Res>  {
$VerifyEmailEventCopyWith(VerifyEmailEvent _, $Res Function(VerifyEmailEvent) __);
}


/// Adds pattern-matching-related methods to [VerifyEmailEvent].
extension VerifyEmailEventPatterns on VerifyEmailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CallSendCode value)?  callSendCode,TResult Function( SendCode value)?  sendCode,TResult Function( Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CallSendCode() when callSendCode != null:
return callSendCode(_that);case SendCode() when sendCode != null:
return sendCode(_that);case Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CallSendCode value)  callSendCode,required TResult Function( SendCode value)  sendCode,required TResult Function( Reset value)  reset,}){
final _that = this;
switch (_that) {
case CallSendCode():
return callSendCode(_that);case SendCode():
return sendCode(_that);case Reset():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CallSendCode value)?  callSendCode,TResult? Function( SendCode value)?  sendCode,TResult? Function( Reset value)?  reset,}){
final _that = this;
switch (_that) {
case CallSendCode() when callSendCode != null:
return callSendCode(_that);case SendCode() when sendCode != null:
return sendCode(_that);case Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  callSendCode,TResult Function( String code)?  sendCode,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CallSendCode() when callSendCode != null:
return callSendCode();case SendCode() when sendCode != null:
return sendCode(_that.code);case Reset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  callSendCode,required TResult Function( String code)  sendCode,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case CallSendCode():
return callSendCode();case SendCode():
return sendCode(_that.code);case Reset():
return reset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  callSendCode,TResult? Function( String code)?  sendCode,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case CallSendCode() when callSendCode != null:
return callSendCode();case SendCode() when sendCode != null:
return sendCode(_that.code);case Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class CallSendCode with DiagnosticableTreeMixin implements VerifyEmailEvent {
  const CallSendCode();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'VerifyEmailEvent.callSendCode'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CallSendCode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'VerifyEmailEvent.callSendCode()';
}


}




/// @nodoc


class SendCode with DiagnosticableTreeMixin implements VerifyEmailEvent {
  const SendCode({required this.code});
  

 final  String code;

/// Create a copy of VerifyEmailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendCodeCopyWith<SendCode> get copyWith => _$SendCodeCopyWithImpl<SendCode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'VerifyEmailEvent.sendCode'))
    ..add(DiagnosticsProperty('code', code));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SendCode&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode {
    return Object.hash(runtimeType,code);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'VerifyEmailEvent.sendCode(code: $code)';
}


}

/// @nodoc
abstract mixin class $SendCodeCopyWith<$Res> implements $VerifyEmailEventCopyWith<$Res> {
  factory $SendCodeCopyWith(SendCode value, $Res Function(SendCode) _then) = _$SendCodeCopyWithImpl;
@useResult
$Res call({
 String code
});




}
/// @nodoc
class _$SendCodeCopyWithImpl<$Res>
    implements $SendCodeCopyWith<$Res> {
  _$SendCodeCopyWithImpl(this._self, this._then);

  final SendCode _self;
  final $Res Function(SendCode) _then;

/// Create a copy of VerifyEmailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,}) {
  return _then(SendCode(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Reset with DiagnosticableTreeMixin implements VerifyEmailEvent {
  const Reset();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'VerifyEmailEvent.reset'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'VerifyEmailEvent.reset()';
}


}




// dart format on
