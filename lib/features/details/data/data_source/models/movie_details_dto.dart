import 'package:json_annotation/json_annotation.dart';

part 'movie_details_dto.g.dart';

@JsonSerializable()
class MovieDetailsDto {
  MovieDetailsDto({
    this.id,
    this.title,
    this.posterPath,
    this.overview,
    this.releaseDate,
  });

  factory MovieDetailsDto.fromJson(Map<String, dynamic> json) {
    return _$MovieDetailsDtoFromJson(json);
  }

  final int? id;
  final String? title;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  final String? overview;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
}
