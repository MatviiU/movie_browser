import 'package:flutter/material.dart';
import 'package:movie_browser/features/movies/data/repository/models/movie_entity.dart';
import 'package:movie_browser/features/movies/presentation/ui/widgets/movie_card.dart';

class MovieList extends StatelessWidget {
  const MovieList({required this.movies, super.key});

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      right: false,
      left: false,
      child: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        separatorBuilder: (context, index) =>
            const Divider(color: Colors.white24, height: 24),
        itemCount: movies.length,
        itemBuilder: (context, index){
          final movie = movies[index];
          return MovieCard(movie: movie);
        },
      ),
    );
  }
}
