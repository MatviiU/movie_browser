import 'package:movie_browser/core/network/movie_api/movies_api_base.dart';
import 'package:movie_browser/features/details/data/data_source/models/movie_details_dto.dart';

class MovieDetailsDataSource {
  MovieDetailsDataSource({required MoviesApiBase moviesApi})
    : _moviesApi = moviesApi;

  final MoviesApiBase _moviesApi;

  Future<MovieDetailsDto> getMovieDetails(int movieId) async {
    try {
      final movie = await _moviesApi.getMovieDetails(movieId);
      return movie;
    } on Exception catch (e) {
      throw Exception('Failed to load movie details: $e');
    }
  }
}
