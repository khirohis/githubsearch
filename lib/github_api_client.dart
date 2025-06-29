import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'repository_item.dart';

class GitHubApiClient {
  Future<List<RepositoryItem>> searchRepositories(String query) async {
    final url = Uri.https('api.github.com', '/search/repositories', {'q': query});
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/vnd.github.v3+json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['items'] is! List) {
        throw Exception('Unexpected response format');
      }
      final List<dynamic> items = data['items'];
      return items.map((item) => RepositoryItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load repositories: ${response.statusCode}');
    }
  }
}

/// GitHub API クライアントのインスタンスを提供するProvider
/// アプリケーション全体でAPIクライアントを共有するために使用する
final githubApiClientProvider = Provider((ref) => GitHubApiClient());