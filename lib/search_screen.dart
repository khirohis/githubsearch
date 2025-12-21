import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:githubsearch/l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _search() {
    // 入力が空でなければ画面遷移
    if (_controller.text.isNotEmpty) {
      // クエリパラメータで検索語句を渡す
      context.push('/results?q=${_controller.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: l10n.searchHint,
            ),
            onSubmitted: (_) => _search(),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _search,
            child: Text(l10n.search),
          ),
        ],
      ),
    );
  }
}