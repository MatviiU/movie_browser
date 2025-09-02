import 'package:json_annotation/json_annotation.dart';

part 'movie_dto.g.dart';

@JsonSerializable()
class MovieDto {
  MovieDto({this.title, this.posterPath, this.overview, this.id});

  factory MovieDto.fromJson(Map<String, dynamic> json) {
    return _$MovieDtoFromJson(json);
  }

  final int? id;
  final String? title;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  final String? overview;
}
