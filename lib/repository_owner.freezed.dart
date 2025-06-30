// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_owner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepositoryOwner {
  String get login;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;

  /// Create a copy of RepositoryOwner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepositoryOwnerCopyWith<RepositoryOwner> get copyWith =>
      _$RepositoryOwnerCopyWithImpl<RepositoryOwner>(
          this as RepositoryOwner, _$identity);

  /// Serializes this RepositoryOwner to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepositoryOwner &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, login, avatarUrl);

  @override
  String toString() {
    return 'RepositoryOwner(login: $login, avatarUrl: $avatarUrl)';
  }
}

/// @nodoc
abstract mixin class $RepositoryOwnerCopyWith<$Res> {
  factory $RepositoryOwnerCopyWith(
          RepositoryOwner value, $Res Function(RepositoryOwner) _then) =
      _$RepositoryOwnerCopyWithImpl;
  @useResult
  $Res call({String login, @JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class _$RepositoryOwnerCopyWithImpl<$Res>
    implements $RepositoryOwnerCopyWith<$Res> {
  _$RepositoryOwnerCopyWithImpl(this._self, this._then);

  final RepositoryOwner _self;
  final $Res Function(RepositoryOwner) _then;

  /// Create a copy of RepositoryOwner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? avatarUrl = null,
  }) {
    return _then(_self.copyWith(
      login: null == login
          ? _self.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _RepositoryOwner implements RepositoryOwner {
  const _RepositoryOwner(
      {required this.login,
      @JsonKey(name: 'avatar_url') required this.avatarUrl});
  factory _RepositoryOwner.fromJson(Map<String, dynamic> json) =>
      _$RepositoryOwnerFromJson(json);

  @override
  final String login;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  /// Create a copy of RepositoryOwner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepositoryOwnerCopyWith<_RepositoryOwner> get copyWith =>
      __$RepositoryOwnerCopyWithImpl<_RepositoryOwner>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RepositoryOwnerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepositoryOwner &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, login, avatarUrl);

  @override
  String toString() {
    return 'RepositoryOwner(login: $login, avatarUrl: $avatarUrl)';
  }
}

/// @nodoc
abstract mixin class _$RepositoryOwnerCopyWith<$Res>
    implements $RepositoryOwnerCopyWith<$Res> {
  factory _$RepositoryOwnerCopyWith(
          _RepositoryOwner value, $Res Function(_RepositoryOwner) _then) =
      __$RepositoryOwnerCopyWithImpl;
  @override
  @useResult
  $Res call({String login, @JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class __$RepositoryOwnerCopyWithImpl<$Res>
    implements _$RepositoryOwnerCopyWith<$Res> {
  __$RepositoryOwnerCopyWithImpl(this._self, this._then);

  final _RepositoryOwner _self;
  final $Res Function(_RepositoryOwner) _then;

  /// Create a copy of RepositoryOwner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? login = null,
    Object? avatarUrl = null,
  }) {
    return _then(_RepositoryOwner(
      login: null == login
          ? _self.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
