import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_app/modules/search/domain/usecases/search_movie_usecase.dart';
import 'package:movie_app/modules/search/external/datasources/search_movie_datasource_api.dart';
import 'package:movie_app/modules/search/infra/repositories/search_movie_repository_impl.dart';
import 'package:movie_app/modules/search/presenter/home_page.dart';

import 'modules/search/presenter/states/triple/moviestore.dart';


class AppModule extends Module{
  @override
  List<Bind> get binds => [
    Bind((i) => SearchMovieDataSourceImpl(i())),
    Bind((i) => SearchMovieUseCaseImpl(i())),
    Bind((i) => Dio()),
    Bind((i) => SearchMovieRepositoryImpl(i())),
    Bind((i) => MovieStore(i())),
  ];

   @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,child: (_, __) => const HomePage() ),
      ];
}