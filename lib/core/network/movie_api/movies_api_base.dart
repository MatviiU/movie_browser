import 'package:movie_browser/features/movies/data/data_source/models/movie_dto.dart';

abstract interface class MoviesApiBase {
  Future<List<MovieDto>> getMovies();
}
