import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/features/details/presentation/cubit/movie_details_cubit.dart';
import 'package:movie_browser/features/details/presentation/cubit/movie_details_state.dart';
import 'package:movie_browser/features/details/presentation/ui/widgets/movie_details_view.dart';
import 'package:movie_browser/features/favorites/presentation/bloc/favorites_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({required this.movieId, super.key});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF0F0F0),

        iconTheme: const IconThemeData(color: Colors.black87),

        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),

        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.3),
        title: const Text('Movie details'),
        actions: [
          BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              return switch (state) {
                FavoritesLoaded(favoriteMovieIds: final favoriteMovieIds) =>
                  IconButton(
                    onPressed: () {
                      final isFavorite = favoriteMovieIds.contains(movieId);
                      switch (isFavorite) {
                        case true:
                          context.read<FavoritesBloc>().add(
                            RemoveFavorite(movieId),
                          );
                        case false:
                          context.read<FavoritesBloc>().add(
                            AddFavorite(movieId),
                          );
                      }
                    },
                    icon: Icon(
                      favoriteMovieIds.contains(movieId)
                          ? Icons.star
                          : Icons.star_border,
                      color: favoriteMovieIds.contains(movieId)
                          ? Colors.amber
                          : Colors.black,
                    ),
                  ),
                _ => const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.star_border, color: Colors.grey),
                ),
              };
            },
          ),
        ],
      ),
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          return switch (state) {
            MovieDetailsInitial() || MovieDetailsLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            MovieDetailsError(message: final message) => Center(
              child: Text('Error: $message'),
            ),
            MovieDetailsLoaded(movie: final movie) => MovieDetailsView(
              movie: movie,
            ),
            _ => const Center(child: Text('Ups... something went wrong')),
          };
        },
      ),
    );
  }
}
