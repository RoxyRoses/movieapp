import 'package:dartz/dartz.dart';
import 'package:movie_app/modules/search/domain/entities/results.dart';
import 'package:movie_app/modules/search/domain/repositories/search_movie_repository.dart';

import '../errors/errors.dart';

abstract class SearchMovieUseCase{
  Future<Either<FailureSearch, List<Results>>> getMovies();
}

class SearchMovieUseCaseImpl implements SearchMovieUseCase{
  final SearchMovieRepository repository;

  SearchMovieUseCaseImpl(this.repository);
  @override
  Future<Either<FailureSearch, List<Results>>> getMovies() async {
    var result = repository.getMovies();
    return result;
  }

}