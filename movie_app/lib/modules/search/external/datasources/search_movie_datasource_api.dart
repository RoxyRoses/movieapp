import 'package:dio/dio.dart';
import 'package:movie_app/modules/search/infra/datasources/search_movie_datasource.dart';

import '../../../../utils/utils.dart';
import '../../domain/entities/results.dart';
import '../../domain/errors/errors.dart';
import '../../infra/models/ResultsDto.dart';


class SearchMovieDataSourceImpl implements SearchMovieDataSource{
  final Dio dio;

  SearchMovieDataSourceImpl(this.dio);

  @override
  Future<List<Results>> getMovies() async {
    final response = await dio.get(baseUrl + url);
    //teste map
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