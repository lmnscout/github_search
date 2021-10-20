import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/modules/search/domain/errors/errors.dart';
import 'package:github_search/modules/search/external/datasources/github_datasource.dart';
import 'package:mockito/mockito.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = GithubDatasouce(dio);

  test('deve retornar uma lista de ResultSearchModel', () {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: jsonDecode(githubResponse), statusCode: 200));

    final future = datasource.getSearch("searchText");
    expect(future, completes);
  });

  test('deve retornar um erro se o codigo não for 200', () {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: null, statusCode: 401));

    final future = datasource.getSearch("searchText");
    expect(future, throwsA(isA<DatasourceError>()));
  });
}

