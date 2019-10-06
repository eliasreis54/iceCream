import 'package:dojo/dojo.dart';

import './model.dart';
import './repository.dart';
import './service.dart';

class PersonController extends ResourceController {
  PersonController(this.context);
  final ManagedContext context;

  Future<Response> validateRequest(int id) async {
    if (id == null) {
      return Response.badRequest(body: { "message": "id must be defined" });
    }
    final person = await PersonRepository(context).findById(id);
    if (person == null) {
      return Response.notFound(body: { "message": "person not found" });
    }
    return null;
  }

  @Operation.get()
  Future<Response> getAllPerson() async {
    final people = await PersonRepository(context).fetchAll();
    return Response.ok(people);
  }

  @Operation.post()
  Future<Response> createPerson(@Bind.body() Person person) async {
    final created = await PersonService(context).createPerson(person);
    created.password = "";
    return Response.ok(created);
  }

  @Operation.get("id")
  Future<Response> getSpecificPerson(@Bind.path("id") int id) async {
    final staus = await validateRequest(id);
    if (staus != null) {
      return staus;
    }
    final person = await PersonRepository(context).findById(id);
    return Response.ok(person);
  }

  @Operation.put("id")
  Future<Response> updatePerson(@Bind.path("id") int id, @Bind.body() Person person) async {
    final staus = await validateRequest(id);
    if (staus != null) {
      return staus;
    }
    final update = await PersonService(context).update(person, id);
    return Response.ok(update);
  }

  @Operation.delete("id")
  Future<Response> deletePerson(@Bind.path("id") int id) async {
    final staus = await validateRequest(id);
    if (staus != null) {
      return staus;
    }
    await PersonService(context).deletePerson(id);
    return Response.noContent();
  }
}
