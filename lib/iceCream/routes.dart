import 'package:dojo/dojo.dart';
import './repository.dart';
import './Model.dart';

class IceCreamController extends ResourceController {
  IceCreamController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllIceCreams() async {
    final iceCreams = await IceCreamRepository(context).fetchAll();
    return Response.ok(iceCreams);
  }

  @Operation.post()
  Future<Response> createIceCream(@Bind.body() IceCream iceCream) async {
    final created = await context.insertObject(iceCream);
    return Response.ok(created);
  }
}
