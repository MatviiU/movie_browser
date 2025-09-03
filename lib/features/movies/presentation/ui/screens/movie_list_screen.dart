import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_browser/features/app/screen_names.dart';
import 'package:movie_browser/features/movies/presentation/bloc/movies_cubit.dart';
import 'package:movie_browser/features/movies/presentation/bloc/movies_state.dart';
import 'package:movie_browser/features/movies/presentation/ui/widgets/movie_list.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        title: const Text('Popular movies'),
        backgroundColor: const Color(0xFFF0F0F0),

        iconTheme: const IconThemeData(color: Colors.black87),

        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),

        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.3),
        actions: [
          IconButton(
            tooltip: 'Favorites',
            onPressed: () {
              context.goNamed(ScreenNames.favorites);
            },
            icon: const Icon(Icons.star, color: Colors.black),
          ),
        ],
      ),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          return switch (state) {
            MoviesInitial() ||
            MoviesLoading() => const Center(child: CircularProgressIndicator()),
            MoviesError(message: final message) => Center(
              child: Text('Error: $message'),
            ),
            MoviesLoaded(movies: final movies) => MovieList(movies: movies),
            _ => const Center(child: Text('Ups... something went wrong')),
          };
        },
      ),
    );
  }
}
