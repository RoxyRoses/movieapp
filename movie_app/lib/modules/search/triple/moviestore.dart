import 'package:dependency_module/core_module.dart';
import 'package:movie_app/modules/search/domain/entities/results.dart';
import 'package:movie_app/modules/search/domain/usecases/search_movie_usecase.dart';

import '../domain/errors/errors.dart';

class MovieStore
    extends MobXStore<Exception, Either<FailureSearch, List<Results>>> {
  final SearchMovieUseCaseImpl usecase;

  MovieStore(Either<FailureSearch, List<Results>> initialState, this.usecase)
      : super(initialState);

  Future<void> add() async {
    try {
      setLoading(true);
      await Future.delayed(const Duration(seconds: 2));
      final result = await usecase.getMovies();
      update(result);
      setLoading(false);
    } catch (e) {
      setError(Exception(e));
    }
  }
}
