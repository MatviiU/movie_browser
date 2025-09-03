import 'package:movie_browser/features/details/data/data_source/models/movie_details_dto.dart';

class MovieDetailsEntity {
  const MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
  });

  factory MovieDetailsEntity.fromDto(MovieDetailsDto dto) {
    return MovieDetailsEntity(
      id: dto.id ?? 0,
      title: dto.title ?? '',
      posterPath: dto.posterPath ?? '',
      overview: dto.overview ?? '',
      releaseDate: dto.releaseDate?.substring(0, 4) ?? '',
    );
  }

  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final String releaseDate;
}
