import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'main_home_page.dart';
import 'search_screen.dart';
import 'settings_screen.dart';
import 'search_result_list.dart';

// Navigatorのグローバルキー
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/search', // 初期表示のパス
    routes: [
      // BottomNavigationBarを持つShellRoute
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          // MainHomePageが共通のUI（Shell）となる
          // child には、サブブランチのルート（SearchScreenやSettingsScreen）が入る
          return MainHomePage(
            title: 'GitHub Search',
            child: child,
          );
        },
        routes: [
          // 検索画面
          GoRoute(
            path: '/search',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SearchScreen(),
            ),
          ),
          // 設定画面
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SettingsScreen(),
            ),
          ),
        ],
      ),
      // 検索結果一覧画面 (ShellRouteの外側)
      GoRoute(
        path: '/results',
        builder: (context, state) {
          final query = state.uri.queryParameters['q'] ?? '';
          return SearchResultList(query: query);
        },
      ),
    ],
  );
});