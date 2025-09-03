import 'package:movie_browser/features/details/data/repository/movie_details_repository.dart';
import 'package:movie_browser/features/movies/data/data_source/movies_data_source.dart';
import 'package:movie_browser/features/movies/data/repository/models/movie_entity.dart';

class MoviesRepository {
  MoviesRepository({
    required this.moviesDataSource,
    required this.movieDetailsRepository,
  });

  final MoviesDataSource moviesDataSource;
  final MovieDetailsRepository movieDetailsRepository;

  Future<List<MovieEntity>> getMovies() async {
    try {
      final movies = await moviesDataSource.getMovies();
      return movies.map(MovieEntity.fromDto).toList();
    } on Exception catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }

  Future<List<MovieEntity>> getMoviesByIds(List<int> movieIds) async {
    try {
      final favoriteMovies = movieIds.map(
        movieDetailsRepository.getMovieDetails,
      ).toList();
      final moviesDetailsList = await Future.wait(favoriteMovies);

      return moviesDetailsList.map(MovieEntity.fromDetailsEntity).toList();
    } on Exception catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }
}
