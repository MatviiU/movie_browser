import 'package:json_annotation/json_annotation.dart';

part 'movie_dto.g.dart';

@JsonSerializable()
class MovieDto {
  MovieDto({this.title, this.posterPath, this.overview});

  factory MovieDto.fromJson(Map<String, dynamic> json) {
    return _$MovieDtoFromJson(json);
  }

  String? title;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  String? overview;
}
