class RepositoryItem {
  final int id;
  final String name;
  final String fullName;
  final String? language;
  final int stargazersCount;
  final int watchersCount;
  final int forksCount;
  final Owner owner;

  RepositoryItem({
    required this.id,
    required this.name,
    required this.fullName,
    this.language,
    required this.stargazersCount,
    required this.watchersCount,
    required this.forksCount,
    required this.owner,
  });

  factory RepositoryItem.fromJson(Map<String, dynamic> json) {
    return RepositoryItem(
      id: json['id'] as int,
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      language: json['language'] as String?,
      stargazersCount: json['stargazers_count'] as int,
      watchersCount: json['watchers_count'] as int,
      forksCount: json['forks_count'] as int,
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
    );
  }
}

class Owner {
  final String login;
  final String avatarUrl;

  Owner({
    required this.login,
    required this.avatarUrl,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
    );
  }
}