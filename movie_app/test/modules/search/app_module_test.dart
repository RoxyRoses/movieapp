import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:movie_app/app_module.dart';
import 'package:movie_app/modules/search/domain/entities/results.dart';
import 'package:movie_app/modules/search/domain/usecases/search_movie_usecase.dart';
import 'package:movie_app/modules/search/external/datasources/search_movie_datasource_api.dart';
import 'package:movie_app/modules/search/infra/repositories/search_movie_repository_impl.dart';
import 'package:movie_app/modules/search/presenter/states/triple/moviestore.dart';

import 'utils/api_response.dart';

class DioMock extends Mock implements Dio{}

class DataSourceMock extends Mock implements SearchMovieDataSourceImpl{}

class RepositoryMock extends Mock implements SearchMovieRepositoryImpl{}

class StoreMock extends Mock implements MovieStore{}

class UseCaseMock extends Mock implements SearchMovieUseCaseImpl{}


main(){
  final dioMock = DioMock();
  final dataSource = DataSourceMock();
  final repository = RepositoryMock();
  final usecase = UseCaseMock();


  setUp((() { 
    initModule(AppModule(), replaceBinds: [
      Bind.instance<Dio>(dioMock),
      Bind.instance<SearchMovieDataSourceImpl>(dataSource),
      Bind.instance<SearchMovieUseCaseImpl>(usecase),
      Bind.instance<SearchMovieRepositoryImpl>(repository),
    ]);
  }));

  test('Should recover dio without error', (() {
    final dio = Modular.get<Dio>();
    expect(dio, isA<Dio>());
  }));

  test('Should recover usecase without error', (() {
    final usecase = Modular.get<SearchMovieUseCaseImpl>();
    expect(usecase, isA<SearchMovieUseCaseImpl>());
  }));

  test('Should recover the datasource without error', (() {
    final datasource = Modular.get<SearchMovieDataSourceImpl>();
    expect(datasource, isA<SearchMovieDataSourceImpl>());
  }));

  test('Should recover the repository without error', (() {
    final repository = Modular.get<SearchMovieRepositoryImpl>();
    expect(repository, isA<SearchMovieRepositoryImpl>());
  }));

  test('Should recover a list of movies', (() async {
    when(() => dioMock.get(any())).thenAnswer((_) async => Response(
        data: jsonDecode(api), statusCode: 200, requestOptions: RequestOptions(path: '')));

    final usecase = Modular.get<SearchMovieUseCaseImpl>();
    final result = await usecase.getMovies();
    expect(result | [], isA<List<Results>>());
  }));

}