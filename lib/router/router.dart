import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/hoge_page.dart';

part 'router.g.dart';

final router = GoRouter(
  routes: $appRoutes,
  initialLocation: HomeRoute.path,
);

@TypedGoRoute<HomeRoute>(
  path: HomeRoute.path,
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}
