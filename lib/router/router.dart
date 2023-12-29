import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/color_picker_dialog.dart';
import 'package:go_router_example/hoge_page.dart';
import 'package:go_router_example/settings_page.dart';
import 'package:go_router_example/top_page.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> settingsNavigatorKey =
    GlobalKey<NavigatorState>();

final router = GoRouter(
  routes: $appRoutes,
  initialLocation: HomeRoute.path,
  navigatorKey: rootNavigatorKey,
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

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

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
  static final GlobalKey<NavigatorState> $navigatorKey = homeNavigatorKey;
}

class SettingsShellBranchData extends StatefulShellBranchData {
  const SettingsShellBranchData();
  static final GlobalKey<NavigatorState> $navigatorKey = settingsNavigatorKey;
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

@TypedGoRoute<ColorPickerDialogRoute>(
  path: ColorPickerDialogRoute.path,
)
class ColorPickerDialogRoute extends GoRouteData {
  const ColorPickerDialogRoute();

  static const path = '/color_picker_dialog';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage<Object>(
        fullscreenDialog: true,
        key: state.pageKey,
        child: const ColorPickerDialog(),
      );
}
