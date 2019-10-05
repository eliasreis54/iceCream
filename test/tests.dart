import '../lib/iceCream/functions.dart';

import 'harness/app.dart';
Future main() async {

  test("Testa se a função soma está correta", () {
    expect(soma(2, 5), equals(14));
    expect(soma(2, 4), isNot(3));
  });
}
