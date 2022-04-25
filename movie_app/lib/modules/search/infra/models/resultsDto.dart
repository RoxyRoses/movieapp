import 'dart:convert';

import 'package:movie_app/modules/search/domain/entities/results.dart';

class ResultsDto extends Results {
  final bool adultDto;
  final String backdropPathDto;
  final int idDto;
  final String originalLanguageDto;
  final String originalTitleDto;
  final String overviewDto;
  final double popularityDto;
  final String posterPathDto;
  final String releaseDateDto;
  final String titleDto;
  final bool videoDto;
  final double voteAverageDto;
  final int voteCountDto;

  ResultsDto(
      {required this.adultDto,
      required this.backdropPathDto,
      required this.idDto,
      required this.originalLanguageDto,
      required this.originalTitleDto,
      required this.overviewDto,
      required this.popularityDto,
      required this.posterPathDto,
      required this.releaseDateDto,
      required this.titleDto,
      required this.videoDto,
      required this.voteAverageDto,
      required this.voteCountDto})
      : super(
            adult: adultDto,
            backdropPath: backdropPathDto,
            id: idDto,
            originalLanguage: originalLanguageDto,
            originalTitle: originalTitleDto,
            overview: overviewDto,
            popularity: popularityDto,
            posterPath: posterPathDto,
            releaseDate: releaseDateDto,
            title: titleDto,
            video: videoDto,
            voteAverage: voteAverageDto,
            voteCount: voteCountDto);

  factory ResultsDto.fromMap(Map<String, dynamic> map) {
    return ResultsDto(
      adultDto: map['adult'] ?? '',
      backdropPathDto: map['backdrop_path'] ?? '',
      idDto: (map['id'] ?? ''),
      originalLanguageDto: map['original_language'] ?? '',
      originalTitleDto: map['original_title'] ?? '',
      overviewDto: map['overview'] ?? '',
      popularityDto: map['popularity'] ?? '',
      posterPathDto: map['poster_path'] ?? '',
      releaseDateDto: map['release_date'] ?? '',
      titleDto: map['title'] ?? '',
      videoDto: map['video'] ?? '',
      voteAverageDto: double.parse((map['vote_average'] ?? '').toString()),
      voteCountDto: map['vote_count'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'adult': adult});
    result.addAll({'backdrop_path': backdropPath});
    result.addAll({'id': id});
    result.addAll({'original_language': originalLanguage});
    result.addAll({'original_title': originalTitle});
    result.addAll({'overview': overview});
    result.addAll({'popularity': popularity});
    result.addAll({'poster_path': posterPath});
    result.addAll({'release_date': releaseDate});
    result.addAll({'title': title});
    result.addAll({'video': video});
    result.addAll({'vote_average': voteAverage});
    result.addAll({'vote_count': voteCount});

    return result;
  }

  String toJson() => json.encode(toMap());

  factory ResultsDto.fromJson(String source) =>
      ResultsDto.fromMap(json.decode(source));
}
