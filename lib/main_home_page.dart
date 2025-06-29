import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'search_app_bar.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/settings')) {
      return 1;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _calculateSelectedIndex(context);
    final isSearchTab = selectedIndex == 0;

    return Scaffold(
      appBar: SearchAppBar(
        title: title,
        isSearchEnabled: isSearchTab,
      ),
      body: Center(
        child: child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/search');
              break;
            case 1:
              context.go('/settings');
              break;
          }
        },
      ),
    );
  }
}
