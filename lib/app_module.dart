import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_search/modules/search/domain/usecases/search_by_text.dart';
import 'package:github_search/modules/search/external/datasources/github_datasource.dart';
import 'package:github_search/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:github_search/modules/search/presenter/search_bloc.dart';
import 'package:github_search/modules/search/presenter/search_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.factory<Dio>((i) => Dio()),
    Bind((i) => GithubDatasouce(i())),
    Bind((i) => SearchRepositoryImpl(i())),
    Bind((i) => SearchByTextImpl(i())),
    Bind((i) => SearchBloc(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => SearchPage()),
  ];
}