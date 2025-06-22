import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> _items  = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  bool _hasMoreData = true;
  int _currentPage = 1;
  final int _itemsPerPage = 20;

  @override
  void initState() {
    super.initState();

    _loadMoreData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200 &&
          !_isLoading &&
          _hasMoreData) {
        _loadMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  Future<void> _loadMoreData() async {
    if (_isLoading || !_hasMoreData) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // generate test data
    await Future.delayed(const Duration(seconds: 2));
    List<String> newItems = List.generate(
        _itemsPerPage,
            (index) => "Page $_currentPage: Item ${_items.length + index + 1}");

    setState(() {
      _items.addAll(newItems);
      _currentPage++;

      if (newItems.length < _itemsPerPage) {
        _hasMoreData = false;
      }

      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _items.length + (_hasMoreData ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _items.length) {
          return _isLoading
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox.shrink();
        }
        return ListTile(
          title: Text(_items[index]),
        );
      }
    );
  }
}