import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/features/favorites/data/favorites_storage_service.dart';
import 'package:movie_browser/features/movies/data/repository/models/movie_entity.dart';
import 'package:movie_browser/features/movies/data/repository/movies_repository.dart';

part 'favorites_state.dart';

part 'favorites_event.dart';

class FavoritesBloc extends Bloc<FavoriteEvent, FavoritesState> {
  FavoritesBloc({
    required FavoriteStorageService favoriteStorageService,
    required MoviesRepository moviesRepository,
  }) : _favoriteStorageService = favoriteStorageService,
       _moviesRepository = moviesRepository,
       super(FavoritesInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<AddFavorite>(_onAddFavorite);
    on<RemoveFavorite>(_onRemoveFavorite);
  }

  final FavoriteStorageService _favoriteStorageService;
  final MoviesRepository _moviesRepository;

  Future<void> _onLoadFavorites(
    LoadFavorites event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());
    try {
      final favoriteMovieIds = await _favoriteStorageService.getFavorites();
      if (favoriteMovieIds.isEmpty) {
        emit(const FavoritesLoaded(movies: [], favoriteMovieIds: []));
        return;
      }
      final movies = await _moviesRepository.getMoviesByIds(favoriteMovieIds);
      emit(FavoritesLoaded(movies: movies, favoriteMovieIds: favoriteMovieIds));
    } catch (e) {
      emit(FavoritesError('Failed to load favorites: $e'));
    }
  }

  Future<void> _onAddFavorite(
    AddFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    final currentFavorites = await _favoriteStorageService.getFavorites();
    final newFavorites = [...currentFavorites, event.movieId];
    await _favoriteStorageService.saveFavorites(newFavorites);
    add(LoadFavorites());
  }

  Future<void> _onRemoveFavorite(
    RemoveFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    final currentFavorites = await _favoriteStorageService.getFavorites();
    final newFavorites = currentFavorites
        .where((id) => id != event.movieId)
        .toList();
    await _favoriteStorageService.saveFavorites(newFavorites);
    add(LoadFavorites());
  }
}
