import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/core/di/get_it.dart';
import 'package:movie_browser/features/movies/presentation/bloc/movies_cubit.dart';
import 'package:movie_browser/features/movies/presentation/bloc/movies_state.dart';
import 'package:movie_browser/features/movies/presentation/ui/widgets/movie_list.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MoviesCubit>()..getMovies(),
      child: Scaffold(
        backgroundColor: const Color(0xFF1C1C1E),
        appBar: AppBar(
          title: const Text('Popular movies'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            return switch (state) {
              MoviesInitial() || MoviesLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              MoviesError(message: final message) => Center(
                child: Text('Error: $message'),
              ),
              MoviesLoaded(movies: final movies) => MovieList(movies: movies),
              _ => const Center(child: Text('Ups... something went wrong')),
            };
          },
        ),
      ),
    );
  }
}
