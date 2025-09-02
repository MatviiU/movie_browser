import 'package:flutter/material.dart';
import 'package:movie_browser/core/di/get_it.dart' as get_it;
import 'package:movie_browser/core/router/app_router.dart';

void main() {
  get_it.setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
