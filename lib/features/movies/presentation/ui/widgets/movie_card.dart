import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_browser/features/app/screen_names.dart';
import 'package:movie_browser/features/movies/data/repository/models/movie_entity.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({required this.movie, super.key});

  final MovieEntity movie;
  final String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(
        ScreenNames.movieDetails,
        pathParameters: {'id': movie.id.toString()},
      ),
      child: Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              '$imageBaseUrl${movie.posterPath}',
              height: 120,
              width: 80,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 120,
                  width: 80,
                  color: Colors.white10,
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  width: 80,
                  color: Colors.white10,
                  child: const Icon(Icons.movie, color: Colors.white54),
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  movie.overview,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
