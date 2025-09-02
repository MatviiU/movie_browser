import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_browser/core/network/movie_api/dio/movies_api_dio.dart';
import 'package:movie_browser/core/network/movie_api/movies_api_base.dart';
import 'package:movie_browser/features/details/data/data_source/movie_details_data_source.dart';
import 'package:movie_browser/features/details/data/repository/movie_details_repository.dart';
import 'package:movie_browser/features/details/presentation/cubit/movie_details_cubit.dart';
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
    ..registerFactory<MoviesCubit>(
      () => MoviesCubit(moviesRepository: getIt<MoviesRepository>()),
    )
    ..registerLazySingleton(
      () => MovieDetailsDataSource(moviesApi: getIt<MoviesApiBase>()),
    )
    ..registerLazySingleton<MovieDetailsRepository>(
      () => MovieDetailsRepository(
        movieDetailsDataSource: getIt<MovieDetailsDataSource>(),
      ),
    )
    ..registerFactory<MovieDetailsCubit>(
      () => MovieDetailsCubit(
        movieDetailsRepository: getIt<MovieDetailsRepository>(),
      ),
    );
}
