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

@TypedStatefulShellRoute<TopShellRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HomeRoute>(path: HomeRoute.path),
      ],
    ),
    TypedStatefulShellBranch<SettingsShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<SettingsRoute>(path: SettingsRoute.path),
      ],
    ),
  ],
)
class TopShellRoute extends StatefulShellRouteData {
  const TopShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigator,
  ) {
    return TopPage(navigationShell: navigator);
  }
}

class HomeShellBranchData extends StatefulShellBranchData {
  const HomeShellBranchData();
}

class SettingsShellBranchData extends StatefulShellBranchData {
  const SettingsShellBranchData();
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
