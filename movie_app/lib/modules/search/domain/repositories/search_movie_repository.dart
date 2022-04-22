import 'package:dependency_module/core_module.dart';
import 'package:movie_app/modules/search/domain/entities/results.dart';

import '../errors/errors.dart';

abstract class SearchMovieRepository {
  Future<Either<FailureSearch, List<Results>>> getMovies();
}
