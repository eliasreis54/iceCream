import 'package:aqueduct/aqueduct.dart';

@Table(name: 'ice_creams')
class _IceCream {
  @primaryKey
  int id;

  @Column(nullable: true)
  String flavor;

  @Column(nullable: true)
  String type;
}

class IceCream extends ManagedObject<_IceCream> implements _IceCream {}
