import 'package:dojo/dojo.dart';
import './Model.dart';

class IceCreamService {
  IceCreamService(this.context);
  final ManagedContext context;


  Future<void> deleteIceCream(int id) async {
    final query = Query<IceCream>(context)
        ..where((iceCream) => iceCream.id).equalTo(id);

    return query.delete();
  }

  Future<IceCream> createIceCream(IceCream iceCream) async {
    return await context.insertObject(iceCream);
  }


  Future<IceCream> update(IceCream iceCream, int id) async {
    final query = Query<IceCream>(context)
        ..values = iceCream
        ..where((iceCream) => iceCream.id).equalTo(id);

    return await query.updateOne();
  }
}
