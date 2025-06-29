import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'github_api_client.dart';
import 'repository_item.dart';

/// 検索クエリを引数として、リポジトリのリストを非同期に提供するProvider
/// .family修飾子により、外部からパラメータを渡すことができる
final searchResultProvider =
    FutureProvider.family<List<RepositoryItem>, String>((ref, query) async {
  // 検索クエリが空の場合は、APIを叩かずに空のリストを返す
  if (query.isEmpty) {
    return [];
  }
  // APIクライアントのインスタンスを取得
  final apiClient = ref.watch(githubApiClientProvider);
  // APIを叩いて検索結果を返す
  return apiClient.searchRepositories(query);
});