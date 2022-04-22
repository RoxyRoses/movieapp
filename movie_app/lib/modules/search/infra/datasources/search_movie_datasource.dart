
import '../../domain/entities/results.dart';

abstract class SearchMovieDataSource {
  Future<List<Results>> getMovies();
}
