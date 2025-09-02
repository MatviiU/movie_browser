import 'package:movie_browser/features/details/data/data_source/movie_details_data_source.dart';
import 'package:movie_browser/features/details/data/repository/models/movie_details_entity.dart';

class MovieDetailsRepository {
  MovieDetailsRepository({required this.movieDetailsDataSource});

  final MovieDetailsDataSource movieDetailsDataSource;

  Future<MovieDetailsEntity> getMovieDetails(int movieId) async {
    try {
      final movie = await movieDetailsDataSource.getMovieDetails(movieId);
      return MovieDetailsEntity.fromDto(movie);
    } on Exception catch (e) {
      throw Exception('Failed to load movie details: $e');
    }
  }
}
