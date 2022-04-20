import 'package:movie_app/modules/search/domain/entities/results.dart';

class Movie {
   int page = 0;
   List<Results> results = [];
   int totalPages = 0;
   int totalResults = 0;

  Movie({required this.page, required this.results, required this.totalPages, required this.totalResults});

  Movie.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['results'] = results.map((v) => v.toJson()).toList();
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}