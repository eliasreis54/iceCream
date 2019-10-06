import 'package:dojo/dojo.dart';
import 'package:dojo/person/model.dart';

class PersonCreator {
  PersonCreator(this.context);

  final ManagedContext context;

  Future<Person> createPerson({ String nome = "Elias", String password = "elias" }) async {
    final p = Person()
        ..nome = nome
        ..password = password;

    return await context.insertObject(p); 
  }
}
