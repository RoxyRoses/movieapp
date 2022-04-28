import 'package:dependency_module/core_module.dart';
import 'package:movie_app/modules/search/infra/models/resultsDto.dart';

class DtoMock extends Mock implements ResultsDto {}

void main() {
  final dto = DtoMock();

  //  test('Should return a list of movies', () {
  //   var result;
  //   when(() => dto.toMap()).thenReturn(result);

  //       expect(result, completes);
  // });

  // test('Should return a list', () {
  //   var result;
  //   when(() => dto.toJson()).thenReturn(result);

  //       expect(result, completes);
  // });
}