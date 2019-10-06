import 'package:dojo/dojo.dart';
import '../utils.dart';
import './model.dart';

class PersonService {
  PersonService(this.context);
  final ManagedContext context;


  Future<void> deletePerson(int id) async {
    final query = Query<Person>(context)
        ..where((person) => person.id).equalTo(id);

    return query.delete();
  }

  Future<Person> createPerson(Person person) async {
    person.password = generateMd5(person.password);
    return await context.insertObject(person);
  }


  Future<Person> update(Person person, int id) async {
    final query = Query<Person>(context)
        ..values = person
        ..where((person) => person.id).equalTo(id);

    return await query.updateOne();
  }
}
