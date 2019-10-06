import '../harness/app.dart';
import './PersonCreator.dart';

Future main() async {
  final harness = Harness()..install();

  tearDown(() async {
    await harness.resetData();
  });


  test("POST /person", () async {
    final response = await harness.agent.post("/person", body: {"nome": "Bob", "password": "bob"});
    expect(response, hasResponse(200, body: {"id": isNotNull, "nome": "Bob", "password": ""}));
  });

  test("GET /person", () async {
    final context = harness.application.channel.context;
    await PersonCreator(context).createPerson();  
    final response = await harness.agent.get("/person");
    expect(response, hasResponse(200, body: [{ "id": isNotNull, "nome": "Elias", "password": "" }]));
  });

  test("GET /person/id", () async {
    final context = harness.application.channel.context;
    final person = await PersonCreator(context).createPerson();

    final response = await harness.agent.get("/person/${person.id}");
    expect(response, hasResponse(200, body: { "id": person.id, "nome": person.nome, "password": "" }));
  });


  test("delete /person/id", () async {
    final context = harness.application.channel.context;
    final person = await PersonCreator(context).createPerson();

    final response = await harness.agent.delete("/person/${person.id}");
    expect(response, hasResponse(204));
  });
}
