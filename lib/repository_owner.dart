import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_owner.freezed.dart';
part 'repository_owner.g.dart';

@freezed
abstract class RepositoryOwner with _$RepositoryOwner {
  const factory RepositoryOwner({
    required String login,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
  }) = _RepositoryOwner;

  factory RepositoryOwner.fromJson(Map<String, dynamic> json) => _$RepositoryOwnerFromJson(json);
}