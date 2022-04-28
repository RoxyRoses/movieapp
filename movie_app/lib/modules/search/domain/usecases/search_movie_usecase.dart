import 'package:dartz/dartz.dart';
import 'package:movie_app/modules/search/domain/entities/results.dart';
import 'package:movie_app/modules/search/domain/repositories/search_movie_repository.dart';

import '../errors/errors.dart';

abstract class SearchMovieUseCase{
  Future<Either<FailureSearch, List<Results>>> getMovies(); //either - tupla - variaveis com 2 ou mais retornos. encapsula através de um tupla os resultados
}

class SearchMovieUseCaseImpl implements SearchMovieUseCase{
  final SearchMovieRepository repository;

  SearchMovieUseCaseImpl(this.repository);
  @override
  Future<Either<FailureSearch, List<Results>>> getMovies() async { //return a list ou exception
    var result = repository.getMovies();
    return result;
  }
  //dominio não deve tratar nada.
}