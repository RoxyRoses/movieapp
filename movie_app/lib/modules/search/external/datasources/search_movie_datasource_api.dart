import 'package:dio/dio.dart';
import 'package:movie_app/modules/search/infra/datasources/search_movie_datasource.dart';

import '../../domain/entities/results.dart';
import '../../domain/errors/errors.dart';
import '../../infra/models/ResultsDto.dart';


class SearchMovieDataSourceImpl implements SearchMovieDataSource{
  final Dio dio;

  SearchMovieDataSourceImpl(this.dio);

  @override
  Future<List<Results>> getMovies() async {
    final response = await dio.get('https://api.themoviedb.org/3/search/movie?api_key=db2624dfeb90f13237bcd301b2c988fb&language=en-US&query=1&page=1&include_adult=false&fbclid=IwAR00gtHE5cunPa5DIAlth6QKekyWezi5UwovZRMCq6gNLuvzbkacDqUc3vQ');

    if (response.statusCode == 200) {
      final list = ((response.data['results'] as List)
          .map((e) => ResultsDto.fromMap(e))
          .toList());
      return list;
    } else {
      throw DataSourceError();
    }
  }

 

  
  

}