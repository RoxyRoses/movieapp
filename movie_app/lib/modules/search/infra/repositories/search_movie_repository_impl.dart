import 'package:dartz/dartz.dart';
import 'package:movie_app/modules/search/domain/errors/errors.dart';
import 'package:movie_app/modules/search/domain/repositories/search_movie_repository.dart';
import 'package:movie_app/modules/search/infra/datasources/search_movie_datasource.dart';

import '../../domain/entities/results.dart';

class SearchMovieRepositoryImpl implements SearchMovieRepository{
  final SearchMovieDataSource dataSource;

  SearchMovieRepositoryImpl(this.dataSource);

  @override
  Future<Either<FailureSearch, List<Results>>> getMovies() async {
    try {
    final result = await dataSource.getMovies();

    return Right(result);
      
    } catch (e) {
      return Left(DataSourceError());
    }
  }

}