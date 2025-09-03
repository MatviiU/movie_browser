import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/core/di/get_it.dart' as di;
import 'package:movie_browser/core/router/app_router.dart';
import 'package:movie_browser/features/favorites/presentation/bloc/favorites_bloc.dart';

void main() {
  di.setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<FavoritesBloc>()..add(LoadFavorites()),
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
