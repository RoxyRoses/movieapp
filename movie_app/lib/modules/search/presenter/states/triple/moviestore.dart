import 'package:dependency_module/core_module.dart';
import 'package:movie_app/modules/search/domain/entities/results.dart';
import 'package:movie_app/modules/search/domain/usecases/search_movie_usecase.dart';

class MovieStore extends MobXStore<Exception, List<Results>> {
  final SearchMovieUseCaseImpl usecase;

  MovieStore(this.usecase) : super(<Results>[]);

  Future<void> getMoviesList() async {
    
      setLoading(true);
      await Future.delayed(const Duration(seconds: 2));
      final result = await usecase.getMovies();
      result.fold((l) {
        setError(l);
        setLoading(false);
      }, (r) {
        update(r);
      });
  }
//facade - controller, orquestrador de stores
}
