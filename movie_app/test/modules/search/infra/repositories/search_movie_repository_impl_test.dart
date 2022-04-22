import 'package:dependency_module/core_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/modules/search/domain/entities/results.dart';
import 'package:movie_app/modules/search/domain/errors/errors.dart';
import 'package:movie_app/modules/search/infra/datasources/search_movie_datasource.dart';
import 'package:movie_app/modules/search/infra/models/ResultsDto.dart';
import 'package:movie_app/modules/search/infra/repositories/search_movie_repository_impl.dart';

class SearchMovieDataSourceMock extends Mock implements SearchMovieDataSource{}
main() {
  final datasource = SearchMovieDataSourceMock();
  final repository = SearchMovieRepositoryImpl(datasource);

  test("Should return a list of results", (() async {
    when(() => datasource.getMovies()).thenAnswer((_) async => <ResultsDto>[]);
    final result = await repository.getMovies();

    expect(result | [], isA<List<Results>>());
  }));

  test('Should return a exception if the datasource fails', (() async {
    when(() => datasource.getMovies())
        .thenThrow(Exception());

    final result = await repository.getMovies();

    expect(result.fold(id, id), isA<DataSourceError>());

  }));
}