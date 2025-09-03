import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_browser/core/di/get_it.dart';
import 'package:movie_browser/features/app/screen_names.dart';
import 'package:movie_browser/features/details/presentation/cubit/movie_details_cubit.dart';
import 'package:movie_browser/features/details/presentation/ui/screens/movie_details_screen.dart';
import 'package:movie_browser/features/favorites/presentation/ui/screens/favorites_list_screen.dart';
import 'package:movie_browser/features/movies/presentation/bloc/movies_cubit.dart';
import 'package:movie_browser/features/movies/presentation/ui/screens/movie_list_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: ScreenNames.movieList,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => getIt<MoviesCubit>()..getMovies(),
          child: const MovieListScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: ScreenNames.movieDetails,
          builder: (context, state) {
            final movieIdString = state.pathParameters['id'];
            final movieId = int.tryParse(movieIdString ?? '') ?? 0;
            return BlocProvider(
              create: (context) =>
                  getIt<MovieDetailsCubit>()..getMovieDetails(movieId),
              child: MovieDetailsScreen(movieId: movieId),
            );
          },
        ),
        GoRoute(
          path: 'favorites',
          name: ScreenNames.favorites,
          builder: (context, state) {
            return const FavoritesListScreen();
          },
        ),
      ],
    ),
  ],
);
