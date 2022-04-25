import 'package:dependency_module/core_module.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/modules/search/domain/entities/results.dart';
import 'package:movie_app/modules/search/external/datasources/search_movie_datasource_api.dart';
import 'package:movie_app/modules/search/infra/repositories/search_movie_repository_impl.dart';
import 'package:movie_app/modules/search/presenter/states/triple/moviestore.dart';
import 'package:triple_test/triple_test.dart';

class RepositoryMock extends Mock implements SearchMovieRepositoryImpl {}

main() {
  MovieStore movieStore = MovieStore(
    SearchMovieRepositoryImpl(
      SearchMovieDataSourceImpl(Dio()),
    ),
  );

  final repository = RepositoryMock();

  storeTest<MovieStore>(
    'Testing triple',
    build: () {
      when(() => repository.getMovies())
          .thenAnswer((_) async => right(<Results>[]));

      return MovieStore(repository);
    },
    act: (store) => store.add(),
    expect: () => [tripleLoading, tripleState, tripleLoading],
  );

  storeTest<MovieStore>(
    'Testing triple error',
    build: () {
      when(() => repository.getMovies()).thenThrow(Exception());

      return MovieStore(repository);
    },
    act: (store) => store.add(),
    expect: () => [tripleLoading, tripleError],
  );
}
