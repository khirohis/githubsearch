import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'main_home_page.dart';
import 'search_screen.dart';
import 'settings_screen.dart';

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
      // ShellRouteの外側に配置したい画面があればここに追加
      // 例:
      // GoRoute(
      //   path: '/detail/:id',
      //   builder: (context, state) => DetailScreen(id: state.pathParameters['id']!),
      // ),
    ],
  );
});