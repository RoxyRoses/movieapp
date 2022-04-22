import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/modules/search/domain/errors/errors.dart';
import 'package:movie_app/modules/search/external/datasources/search_movie_datasource_api.dart';

import '../../utils/api_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasouce = SearchMovieDataSourceImpl(dio);

  test('Should return a list of movies', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        data: jsonDecode(api), statusCode: 200, requestOptions: RequestOptions(path: '')));

        final future =  datasouce.getMovies();

        expect(future, completes);
  });

   test('Should return a error if code its not 200', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        data: null, statusCode: 401, requestOptions: RequestOptions(path: '')));

        final future =  datasouce.getMovies();

        expect(future, throwsA(isA<DataSourceError>()));
  });

  test('Should return a exception if error on dio ', () async {
    when(() => dio.get(any())).thenThrow(Exception());

        final future =  datasouce.getMovies();

        expect(future, throwsA(isA<Exception>()));
  });

}