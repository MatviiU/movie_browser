import 'package:equatable/equatable.dart';
import 'package:movie_browser/features/movies/data/repository/models/movie_entity.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  const MoviesLoaded(this.movies);

  final List<MovieEntity> movies;

  @override
  List<Object> get props => [movies];
}

class MoviesError extends MoviesState {
  const MoviesError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
