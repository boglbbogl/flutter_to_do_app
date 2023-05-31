import 'package:flutter/material.dart';
import 'package:flutter_to_do/main_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(initialLocation: "/main", routes: <RouteBase>[
  GoRoute(
    path: "/main",
    builder: (BuildContext context, GoRouterState state) => const MainPage(),
  )
]);
