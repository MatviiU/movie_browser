import 'package:go_router/go_router.dart';
import 'package:movie_browser/features/app/screen_names.dart';
import 'package:movie_browser/features/details/presentation/ui/screens/movie_details_screen.dart';
import 'package:movie_browser/features/movies/presentation/ui/screens/movie_list_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: ScreenNames.movieList,
      builder: (context, state) => const MovieListScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: ScreenNames.movieDetails,
          builder: (context, state) {
            final movieIdString = state.pathParameters['id'];
            final movieId = int.tryParse(movieIdString ?? '') ?? 0;
            return MovieDetailsScreen(movieId: movieId);
          },
        ),
      ],
    ),
  ],
);
