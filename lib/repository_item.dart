import 'package:freezed_annotation/freezed_annotation.dart';
import 'repository_owner.dart';

part 'repository_item.freezed.dart';
part 'repository_item.g.dart';

@freezed
abstract class RepositoryItem with _$RepositoryItem {
  const factory RepositoryItem({
    required int id,
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    String? language,
    @JsonKey(name: 'stargazers_count') required int stargazersCount,
    @JsonKey(name: 'watchers_count') required int watchersCount,
    @JsonKey(name: 'forks_count') required int forksCount,
    required RepositoryOwner owner,
  }) = _RepositoryItem;

  factory RepositoryItem.fromJson(Map<String, dynamic> json) =>
      _$RepositoryItemFromJson(json);
}
