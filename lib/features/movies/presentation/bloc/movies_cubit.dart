import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/features/movies/data/repository/movies_repository.dart';
import 'package:movie_browser/features/movies/presentation/bloc/movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required MoviesRepository moviesRepository})
    : _moviesRepository = moviesRepository,
      super(MoviesInitial());

  final MoviesRepository _moviesRepository;

  Future<void> getMovies() async {
    try {
      emit(MoviesLoading());
      final movies = await _moviesRepository.getMovies();
      emit(MoviesLoaded(movies));
    } catch (e) {
      emit(MoviesError('Failed to load movies: $e'));
    }
  }
}
