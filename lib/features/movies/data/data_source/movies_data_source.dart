import 'package:movie_browser/core/network/movie_api/movies_api_base.dart';
import 'package:movie_browser/features/movies/data/data_source/models/movie_dto.dart';

class MoviesDataSource {
  MoviesDataSource({required MoviesApiBase moviesApi}) : _moviesApi = moviesApi;

  final MoviesApiBase _moviesApi;

  Future<List<MovieDto>> getMovies() async {
    try {
      final movies = await _moviesApi.getMovies();
      return movies;
    } on Exception catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }
}
