import 'package:dependency_module/core_module.dart';
import 'package:movie_app/modules/search/domain/entities/results.dart';
import 'package:movie_app/modules/search/infra/repositories/search_movie_repository_impl.dart';


class MovieStore
    extends MobXStore<Exception, List<Results>> {
  final SearchMovieRepositoryImpl repository;

  MovieStore(this.repository): super(<Results>[]);

  Future<void> add() async {
    try {
      setLoading(true);
      await Future.delayed(const Duration(seconds: 2));
      final result = await repository.getMovies();
      List<Results> list = [];
      result.fold((l) => null, (r) => list);
      update(list);
      setLoading(false);
    } catch (e) {
      setError(Exception(e));
    }
  }
}
