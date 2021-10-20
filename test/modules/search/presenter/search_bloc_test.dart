import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:github_search/modules/search/domain/entities/result_search.dart';
import 'package:github_search/modules/search/domain/errors/errors.dart';
import 'package:github_search/modules/search/domain/usecases/search_by_text.dart';
import 'package:github_search/modules/search/presenter/search_bloc.dart';
import 'package:github_search/modules/search/presenter/states/search_state.dart';
import 'package:mockito/mockito.dart';

class SearchByTextMock extends Mock implements SearchByTextImpl {}

main() {
  final usecase = SearchByTextMock();
  final bloc = SearchBloc(usecase);

  test("Deve retornar os estados na ordem correta", () async {
    when(usecase.call(any))
        .thenAnswer((_) async => const Right(<ResultSearch>[]));

    bloc.add("leandro");
    expect(
        bloc.stream,
        emitsInOrder([
          isA<SearchLoading>(),
          isA<SearchSuccess>(),
        ]));
  });

  test('Deve retornar error', () {
    when(usecase.call(any)).thenAnswer((_) async => Left(InvalidTextError()));

    bloc.add("leandro");
    expect(
        bloc.stream,
        emitsInOrder([
          isA<SearchLoading>(),
          isA<SearchError>(),
        ]));
  });

  
}
