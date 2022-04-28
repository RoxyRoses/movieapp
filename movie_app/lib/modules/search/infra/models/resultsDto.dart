import 'dart:convert';

import 'package:movie_app/modules/search/domain/entities/results.dart';

class ResultsDto extends Results {
  final String originalLanguageDto;
  final String posterPathDto;
  final String releaseDateDto;
  final String titleDto;
  final double voteAverageDto;

  ResultsDto(
      {
      required this.originalLanguageDto,
      required this.posterPathDto,
      required this.releaseDateDto,
      required this.titleDto,
      required this.voteAverageDto,
      })
      : super(
            
            originalLanguage: originalLanguageDto,
            posterPath: posterPathDto,
            releaseDate: releaseDateDto,
            title: titleDto,
            voteAverage: voteAverageDto,
            );

  factory ResultsDto.fromMap(Map<String, dynamic> map) {
    return ResultsDto(
      
      originalLanguageDto: map['original_language'] ?? '',
      posterPathDto: map['poster_path'] ?? '',
      releaseDateDto: map['release_date'] ?? '',
      titleDto: map['title'] ?? '',
      voteAverageDto: double.parse((map['vote_average'] ?? '').toString()),
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'original_language': originalLanguage});
    result.addAll({'poster_path': posterPath});
    result.addAll({'release_date': releaseDate});
    result.addAll({'title': title});
    result.addAll({'vote_average': voteAverage});

    return result;
  }

  String toJson() => json.encode(toMap());

  factory ResultsDto.fromJson(String source) =>
      ResultsDto.fromMap(json.decode(source));
}
