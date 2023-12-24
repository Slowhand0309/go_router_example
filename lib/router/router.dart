import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/hoge_page.dart';
import 'package:go_router_example/settings_page.dart';
import 'package:go_router_example/top_page.dart';

part 'router.g.dart';

final router = GoRouter(
  routes: $appRoutes,
  initialLocation: HomeRoute.path,
);

@TypedShellRoute<TopShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(path: HomeRoute.path),
    TypedGoRoute<SettingsRoute>(path: SettingsRoute.path),
  ],
)
class TopShellRoute extends ShellRouteData {
  const TopShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return TopPage(child: navigator);
  }
}

@TypedGoRoute<HomeRoute>(
  path: HomeRoute.path,
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@TypedGoRoute<SettingsRoute>(
  path: SettingsRoute.path,
)
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  static const path = '/settings';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
}
