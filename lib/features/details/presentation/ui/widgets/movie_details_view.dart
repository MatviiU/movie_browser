import 'package:flutter/material.dart';
import 'package:movie_browser/features/details/data/repository/models/movie_details_entity.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({required this.movie, super.key});

  final MovieDetailsEntity movie;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      right: false,
      left: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Release date: ${movie.releaseDate}',
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              movie.overview,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
