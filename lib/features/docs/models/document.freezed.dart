// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Doc _$DocFromJson(Map<String, dynamic> json) {
  return _Doc.fromJson(json);
}

/// @nodoc
mixin _$Doc {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<dynamic>? get content => throw _privateConstructorUsedError;
  String? get ownerId => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocCopyWith<Doc> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocCopyWith<$Res> {
  factory $DocCopyWith(Doc value, $Res Function(Doc) then) =
      _$DocCopyWithImpl<$Res, Doc>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? title,
      List<dynamic>? content,
      String? ownerId,
      int createdAt});
}

/// @nodoc
class _$DocCopyWithImpl<$Res, $Val extends Doc> implements $DocCopyWith<$Res> {
  _$DocCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? ownerId = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocImplCopyWith<$Res> implements $DocCopyWith<$Res> {
  factory _$$DocImplCopyWith(_$DocImpl value, $Res Function(_$DocImpl) then) =
      __$$DocImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? title,
      List<dynamic>? content,
      String? ownerId,
      int createdAt});
}

/// @nodoc
class __$$DocImplCopyWithImpl<$Res> extends _$DocCopyWithImpl<$Res, _$DocImpl>
    implements _$$DocImplCopyWith<$Res> {
  __$$DocImplCopyWithImpl(_$DocImpl _value, $Res Function(_$DocImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? ownerId = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$DocImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocImpl implements _Doc {
  const _$DocImpl(
      {@JsonKey(name: '_id') this.id,
      this.title = 'Untitled',
      final List<dynamic>? content,
      this.ownerId,
      required this.createdAt})
      : _content = content;

  factory _$DocImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey()
  final String? title;
  final List<dynamic>? _content;
  @override
  List<dynamic>? get content {
    final value = _content;
    if (value == null) return null;
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? ownerId;
  @override
  final int createdAt;

  @override
  String toString() {
    return 'Doc(id: $id, title: $title, content: $content, ownerId: $ownerId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title,
      const DeepCollectionEquality().hash(_content), ownerId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocImplCopyWith<_$DocImpl> get copyWith =>
      __$$DocImplCopyWithImpl<_$DocImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocImplToJson(
      this,
    );
  }
}

abstract class _Doc implements Doc {
  const factory _Doc(
      {@JsonKey(name: '_id') final String? id,
      final String? title,
      final List<dynamic>? content,
      final String? ownerId,
      required final int createdAt}) = _$DocImpl;

  factory _Doc.fromJson(Map<String, dynamic> json) = _$DocImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get title;
  @override
  List<dynamic>? get content;
  @override
  String? get ownerId;
  @override
  int get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$DocImplCopyWith<_$DocImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
