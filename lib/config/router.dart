import 'package:doks/features/auth/pages/login_page.dart';
import 'package:doks/features/home/page/home_page.dart';
import 'package:flutter/material.dart' show MaterialPage;
import 'package:routemaster/routemaster.dart';

final loggedOutRoutes = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginPage()),
});

final loggedInRoutes = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomePage()),
});
