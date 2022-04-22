import 'package:dependency_module/core_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/modules/search/domain/entities/results.dart';
import 'package:movie_app/modules/search/domain/repositories/search_movie_repository.dart';
import 'package:movie_app/modules/search/domain/usecases/search_movie_usecase.dart';

class MovieRepositoryMock extends Mock implements SearchMovieRepository {}

main() {
  final repository = MovieRepositoryMock();
  final usecase = SearchMovieUseCaseImpl(repository);

  test('should return a list of movies', () async {
    when(() => repository.getMovies())
        .thenAnswer((_) async => right(<Results>[]));
    final result = await usecase.getMovies();
    expect(result | [], isA<List<Results>>());
  });
}
