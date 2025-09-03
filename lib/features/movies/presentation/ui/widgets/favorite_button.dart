import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/features/favorites/presentation/bloc/favorites_bloc.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({required this.movieId, super.key});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        return switch (state) {
          FavoritesLoaded(favoriteMovieIds: final favoriteMovieIds) =>
            IconButton(
              onPressed: () {
                final isFavorite = favoriteMovieIds.contains(movieId);
                switch (isFavorite) {
                  case true:
                    context.read<FavoritesBloc>().add(RemoveFavorite(movieId));
                  case false:
                    context.read<FavoritesBloc>().add(AddFavorite(movieId));
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
    );
  }
}
