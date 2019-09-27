import 'package:aqueduct/aqueduct.dart';

import './Model.dart';

class IceCreamRepository {
  IceCreamRepository(this.context);

  final ManagedContext context;

  Future<IceCream> findById(int id) async {
    final query = Query<IceCream>(context)
        ..where((iceCream) => iceCream.id).equalTo(id);

    return await query.fetchOne();
  }

  Future<List<IceCream>> fetchAll() async {
    final query = Query<IceCream>(context);
    return await query.fetch();
  }

  Future<IceCream> update(IceCream iceCream, int id) async {
    final query = Query<IceCream>(context)
        ..values = iceCream
        ..where((iceCream) => iceCream.id).equalTo(id);

    return await query.updateOne();
  }
}
