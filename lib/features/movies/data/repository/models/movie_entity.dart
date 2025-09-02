import 'package:movie_browser/features/movies/data/data_source/models/movie_dto.dart';

class MovieEntity {
  const MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory MovieEntity.fromDto(MovieDto dto) {
    return MovieEntity(
      id: dto.id ?? 0,
      title: dto.title ?? '',
      posterPath: dto.posterPath ?? '',
      overview: dto.overview ?? '',
    );
  }

  final int id;
  final String title;
  final String posterPath;
  final String overview;
}
