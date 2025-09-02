import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_browser/core/network/movie_api/dio/movies_api_dio.dart';
import 'package:movie_browser/core/network/movie_api/movies_api_base.dart';
import 'package:movie_browser/features/movies/data/data_source/movies_data_source.dart';
import 'package:movie_browser/features/movies/data/repository/movies_repository.dart';
import 'package:movie_browser/features/movies/presentation/bloc/movies_cubit.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt
    ..registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3')),
    )
    ..registerLazySingleton<MoviesApiBase>(
      () => MoviesApiDio(dio: getIt<Dio>()),
    )
    ..registerLazySingleton<MoviesDataSource>(
      () => MoviesDataSource(moviesApi: getIt<MoviesApiBase>()),
    )
    ..registerLazySingleton<MoviesRepository>(
      () => MoviesRepository(moviesDataSource: getIt<MoviesDataSource>()),
    )
    ..registerLazySingleton<MoviesCubit>(
      () => MoviesCubit(moviesRepository: getIt<MoviesRepository>()),
    );
}
