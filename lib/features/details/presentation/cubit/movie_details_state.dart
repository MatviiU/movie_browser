import 'package:equatable/equatable.dart';
import 'package:movie_browser/features/details/data/repository/models/movie_details_entity.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  const MovieDetailsLoaded(this.movie);

  final MovieDetailsEntity movie;

  @override
  List<Object> get props => [movie];
}

class MovieDetailsError extends MovieDetailsState {
  const MovieDetailsError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
