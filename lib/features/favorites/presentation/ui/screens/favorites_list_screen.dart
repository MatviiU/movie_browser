import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:movie_browser/features/favorites/presentation/ui/widgets/favorite_movie_list.dart';

class FavoritesListScreen extends StatelessWidget {
  const FavoritesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(title: const Text('Favorites')),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          return switch (state) {
            FavoritesInitial() || FavoritesLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            FavoritesError(message: final message) => Center(
              child: Text('Error: $message'),
            ),
            FavoritesLoaded(movies: final movies) =>
              movies.isEmpty
                  ? const Center(child: Text('No favorites'))
                  : FavoriteMovieList(movies: movies),
            _ => const Center(child: Text('Ups... something went wrong')),
          };
        },
      ),
    );
  }
}
