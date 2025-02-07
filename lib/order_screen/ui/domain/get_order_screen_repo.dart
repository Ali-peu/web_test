import 'package:web_test/order_screen/data/backend_api.dart';
import 'package:web_test/order_screen/domain/models/product_model.dart';

class GetOrderScreenRepo {
  final BackendApi backendApi;

  const GetOrderScreenRepo({required this.backendApi});

  Future<List<ProductModel>?> getPromotionalItems() async {
    try {
      final list = await backendApi.getPromotionalItems();
      if (list != null) {
        return list.map((e) => ProductModel.fromJson(e)).toList();
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
