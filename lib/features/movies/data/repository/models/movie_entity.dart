import 'package:movie_browser/features/details/data/repository/models/movie_details_entity.dart';
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

  factory MovieEntity.fromDetailsEntity(MovieDetailsEntity entity) {
    return MovieEntity(
      id: entity.id,
      title: entity.title,
      posterPath: entity.posterPath,
      overview: entity.overview,
    );
  }

  final int id;
  final String title;
  final String posterPath;
  final String overview;
}
