import 'package:doks/features/auth/pages/login_page.dart';
import 'package:doks/features/docs/views/doc_page.dart';
import 'package:doks/features/home/page/home_page.dart';
import 'package:doks/utils/strings.dart';
import 'package:flutter/material.dart' show MaterialPage;
import 'package:routemaster/routemaster.dart';

final loggedOutRoutes = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginPage()),
});

final loggedInRoutes = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomePage()),
  '/${Strings.documents}/:id': (route) => MaterialPage(
        child: DocPage(id: route.pathParameters['id']!),
      ),
});
