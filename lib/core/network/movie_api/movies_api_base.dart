import 'package:movie_browser/features/details/data/data_source/models/movie_details_dto.dart';
import 'package:movie_browser/features/movies/data/data_source/models/movie_dto.dart';

abstract interface class MoviesApiBase {
  Future<List<MovieDto>> getMovies();
  Future<MovieDetailsDto> getMovieDetails(int movieId);
}
