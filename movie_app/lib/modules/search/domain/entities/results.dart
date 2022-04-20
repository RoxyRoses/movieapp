
import 'dart:convert';

class Results {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Results(
      { required this.adult,
      required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

    factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      adult: map['adult'] ?? '',
      backdropPath: map['backdrop_path'] ?? '',
      genreIds: map['genre_ids'] ?? '',
      id: (map['id'] ?? ''),
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity'] ?? '',
      posterPath: map['poster_path'] ?? '',
      releaseDate: map['release_date'] ?? '',
      title: map['title'] ?? '',
      video: map['video'] ?? '',
      voteAverage: map['vote_average'] ?? '',
      voteCount: map['vote_count'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'adult': adult});
    result.addAll({'backdrop_path': backdropPath});
    result.addAll({'genre_ids': genreIds});
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

  factory Results.fromJson(String source) => Results.fromMap(json.decode(source));
}