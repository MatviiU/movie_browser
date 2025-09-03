part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  const FavoritesLoaded({required this.movies, required this.favoriteMovieIds});

  final List<MovieEntity> movies;
  final List<int> favoriteMovieIds;

  @override
  List<Object> get props => [movies, favoriteMovieIds];
}

class FavoritesError extends FavoritesState {
  const FavoritesError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
