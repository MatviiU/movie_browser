import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/features/details/data/repository/movie_details_repository.dart';
import 'package:movie_browser/features/details/presentation/cubit/movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit({required MovieDetailsRepository movieDetailsRepository})
    : _movieDetailsRepository = movieDetailsRepository,
      super(MovieDetailsInitial());

  final MovieDetailsRepository _movieDetailsRepository;

  Future<void> getMovieDetails(int movieId) async {
    try {
      emit(MovieDetailsLoading());
      final movie = await _movieDetailsRepository.getMovieDetails(movieId);
      emit(MovieDetailsLoaded(movie));
    } catch (e) {
      emit(MovieDetailsError('Failed to load movie details: $e'));
    }
  }
}
