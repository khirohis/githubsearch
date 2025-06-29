import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'search_result_provider.dart';

class SearchResultList extends ConsumerWidget {
  const SearchResultList({
    super.key,
    required this.query,
  });

  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncResult = ref.watch(searchResultProvider(query));

    return Scaffold(
      appBar: AppBar(
        // 渡されたクエリをタイトルに表示
        title: Text(query.isEmpty ? 'Search Results' : 'Results for "$query"'),
      ),
      body: asyncResult.when(
        data: (repositories) {
          if (repositories.isEmpty) {
            return const Center(
              child: Text('No repositories found.'),
            );
          }
          return ListView.builder(
            itemCount: repositories.length,
            itemBuilder: (context, index) {
              final repository = repositories[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(repository.owner.avatarUrl),
                ),
                title: Text(repository.fullName),
                subtitle: Text(repository.language ?? 'No language'),
                trailing: Text('⭐️ ${repository.stargazersCount}'),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
      ),
    );
  }
}