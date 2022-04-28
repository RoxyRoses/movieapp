import 'package:dependency_module/core_module.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/modules/search/domain/entities/results.dart';
import 'package:movie_app/modules/search/domain/usecases/search_movie_usecase.dart';
import 'package:movie_app/modules/search/external/datasources/search_movie_datasource_api.dart';
import 'package:movie_app/modules/search/infra/repositories/search_movie_repository_impl.dart';
import 'package:movie_app/modules/search/presenter/states/triple/moviestore.dart';
import 'package:triple_test/triple_test.dart';

class UseCaseMock extends Mock implements SearchMovieUseCaseImpl {}

main() {
  MovieStore movieStore = MovieStore(
    SearchMovieUseCaseImpl(
      SearchMovieRepositoryImpl(SearchMovieDataSourceImpl(Dio())),
    ),
  );

  final usecase = UseCaseMock();

  storeTest<MovieStore>(
    'Testing triple',
    build: () {
      when(() => usecase.getMovies())
          .thenAnswer((_) async => right(<Results>[]));

      return MovieStore(usecase);
    },
    act: (store) => store.getMoviesList(),
    expect: () => [tripleLoading, tripleState],
  );

  storeTest<MovieStore>(
    'Testing triple error',
    build: () {
      when(() => usecase.getMovies()).thenThrow(Exception());

      return MovieStore(usecase);
    },
    act: (store) => store.getMoviesList(),
    expect: () => [tripleLoading, tripleError],
  );
}
