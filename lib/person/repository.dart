
import 'package:aqueduct/aqueduct.dart';
import './model.dart';

class PersonRepository {
  PersonRepository(this.context);

  final ManagedContext context;

  Future<Person> findById(int id) async {
    final query = Query<Person>(context)
        ..where((person) => person.id).equalTo(id);

    return await query.fetchOne();
  }

  Future<List<Person>> fetchAll() async {
    final query = Query<Person>(context);
    return await query.fetch();
  }
}
