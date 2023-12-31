import 'package:doks/config/router.dart';
import 'package:doks/features/auth/providers.dart';
import 'package:doks/utils/global_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    getAndSetUser();
  }

  void getAndSetUser() async {
    final user = await ref.read(authRepositoryProvider).getUserData();
    if (user != null) ref.read(userProvider.notifier).state = user;
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
        title: 'Doks',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        scaffoldMessengerKey: scaffoldMessengerKey,
        routerDelegate: RoutemasterDelegate(
          routesBuilder: (_) => user != null && user.token != null
              ? loggedInRoutes
              : loggedOutRoutes,
        ),
        routeInformationParser: const RoutemasterParser(),
      ),
    );
  }
}
