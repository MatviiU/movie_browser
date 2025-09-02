import 'package:movie_browser/features/movies/data/data_source/movies_data_source.dart';
import 'package:movie_browser/features/movies/data/repository/models/movie_entity.dart';

class MoviesRepository {
  MoviesRepository({required this.moviesDataSource});

  final MoviesDataSource moviesDataSource;

  Future<List<MovieEntity>> getMovies() async {
    try {
      final movies = await moviesDataSource.getMovies();
      return movies.map(MovieEntity.fromDto).toList();
    } on Exception catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }
}
