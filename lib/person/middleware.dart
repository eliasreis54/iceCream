import 'package:dojo/dojo.dart';

class PersonMiddleware extends Controller {
  @override
  Future<RequestOrResponse> handle(Request request) async {
    request.addResponseModifier((response) {
      final isList = response.body is List;
      if ((response.body != null) && (!isList)) {
        if (response.body["password"] != null) {
          try {
            response.body["password"] = "";
          } catch (e) {
            print("is not a map object");
          }
        }
      }

      if (isList) {
        for (final item in response.body) {
          item["password"] = "";
        }
      }
    });
    return request;
  }
}
