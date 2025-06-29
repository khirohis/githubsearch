import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 検索モードの状態を管理するProvider
// `autoDispose` をつけることで、Providerが不要になった際に自動的に破棄されます。
final isSearchingProvider = StateProvider.autoDispose<bool>((ref) => false);

class SearchAppBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({
    super.key,
    required this.title,
    required this.isSearchEnabled,
    this.onSubmitted,
  });

  final String title;
  final bool isSearchEnabled;
  final ValueSetter<String>? onSubmitted;

  @override
  ConsumerState<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchAppBarState extends ConsumerState<SearchAppBar> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _startSearch() {
    ref.read(isSearchingProvider.notifier).state = true;
  }
  
  void _stopSearch() {
    ref.read(isSearchingProvider.notifier).state = false;
    _searchController.clear();
  }

  Widget _buildTitle(bool isSearching) {
    if (isSearching) {
      return TextField(
        controller: _searchController,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white70),
        ),
        style: const TextStyle(color: Colors.white, fontSize: 18.0),
        onSubmitted: (value) {
          widget.onSubmitted?.call(value);
        },
      );
    } else {
      return Text(widget.title);
    }
  }

  List<Widget> _buildActions(bool isSearching) {
    if (isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchController.text.isEmpty) {
              _stopSearch();
            } else {
              _searchController.clear();
            }
          },
        ),
      ];
    }
    
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isSearching = ref.watch(isSearchingProvider);

    if (!widget.isSearchEnabled) {
    // 検索が有効でない場合は、シンプルなAppBarを表示
      return AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red, // 区別のため色を変更
      );
    }

    // 検索が有効な場合は、検索機能付きのAppBarを表示
    return AppBar(
      backgroundColor: Colors.blue,
      leading: isSearching ? IconButton(icon: const Icon(Icons.arrow_back), onPressed: _stopSearch) : null,
      title: _buildTitle(isSearching),
      actions: _buildActions(isSearching),
    );
  }
}