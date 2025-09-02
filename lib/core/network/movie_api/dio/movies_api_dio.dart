import 'package:dio/dio.dart';
import 'package:movie_browser/core/network/movie_api/movies_api_base.dart';
import 'package:movie_browser/features/details/data/data_source/models/movie_details_dto.dart';
import 'package:movie_browser/features/movies/data/data_source/models/movie_dto.dart';

class MoviesApiDio implements MoviesApiBase {
  MoviesApiDio({required this.dio});

  final Dio dio;

  static const String _apiKey = String.fromEnvironment('API_KEY');

  @override
  Future<List<MovieDto>> getMovies() async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '/movie/popular',
        queryParameters: {'api_key': _apiKey, 'language': 'uk-UA', 'page': 1},
      );

      final data = response.data?['results'] as List?;

      if (data == null) {
        throw Exception('Results are null');
      }

      final movies = data
          .map((e) => MovieDto.fromJson(e as Map<String, dynamic>))
          .toList();

      return movies;
    } on DioException catch (e) {
      throw Exception('Failed to load movies: ${e.message}');
    }
  }

  @override
  Future<MovieDetailsDto> getMovieDetails(int movieId) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '/movie/$movieId',
        queryParameters: {'api_key': _apiKey, 'language': 'uk-UA'},
      );

      final data = response.data;
      if (data == null) {
        throw Exception('Results are null');
      }
      final movie = MovieDetailsDto.fromJson(data);
      return movie;
    } on DioException catch (e) {
      throw Exception('Failed to load movie details: ${e.message}');
    }
  }
}
