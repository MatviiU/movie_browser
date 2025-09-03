part of 'favorites_bloc.dart';

abstract class FavoriteEvent {}

class LoadFavorites extends FavoriteEvent {}

class AddFavorite extends FavoriteEvent {
  AddFavorite(this.movieId);

  final int movieId;
}

class RemoveFavorite extends FavoriteEvent {
  RemoveFavorite(this.movieId);

  final int movieId;
}
