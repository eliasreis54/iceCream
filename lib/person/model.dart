import 'package:aqueduct/aqueduct.dart';

@Table(name: 'person')
class _Person {
  @primaryKey
  int id;

  @Column(nullable: false)
  String nome;

  @Column(nullable: false)
  String password;
}

class Person extends ManagedObject<_Person> implements _Person{}
