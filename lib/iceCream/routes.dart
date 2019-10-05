import 'package:dojo/dojo.dart';

import './Model.dart';
import './repository.dart';
import './service.dart';

class IceCreamController extends ResourceController {
  IceCreamController(this.context);
  final ManagedContext context;

  Future<Response> validateRequest(int id) async {
    if (id == null) {
      return Response.badRequest(body: { "message": "id must be defined" });
    }

    final iceCream = await IceCreamRepository(context).findById(id);
    if (iceCream == null) {
      return Response.notFound(body: { "message": "icreCream not found" });
    }

    return null;
  }

  @Operation.get()
  Future<Response> getAllIceCreams() async {
    final iceCreams = await IceCreamRepository(context).fetchAll();
    return Response.ok(iceCreams);
  }

  @Operation.post()
  Future<Response> createIceCream(@Bind.body() IceCream iceCream) async {
    final created = await IceCreamService(context).createIceCream(iceCream);
    return Response.ok(created);
  }

  @Operation.get("id")
  Future<Response> getSpecifIceCream(@Bind.path("id") int id) async {
    await validateRequest(id); 
    final icreCream = await IceCreamRepository(context).findById(id);
    return Response.ok(icreCream);
  }

  @Operation.put("id")
  Future<Response> updateIceCream(@Bind.path("id") int id, @Bind.body() IceCream iceCream) async {
    await validateRequest(id); 
    final update = await IceCreamService(context).update(iceCream, id);
    return Response.ok(update);
  }

  @Operation.delete("id")
  Future<Response> deleteIceCream(@Bind.path("id") int id) async {
    await validateRequest(id);
    await IceCreamService(context).deleteIceCream(id);
    return Response.noContent();
  }
}
