import 'package:flutter/material.dart';
import 'package:web_test/order_screen/domain/models/product_model.dart';
import 'package:web_test/order_screen/ui/domain/get_order_screen_repo.dart';

class OrderScreenViewModel extends ChangeNotifier {
  final GetOrderScreenRepo getOrderScreenRepo;

  List<ProductModel> promotionalProducts = [];
  bool showError = false;

  OrderScreenViewModel({required this.getOrderScreenRepo});

  Future<void> getPromotionalProducts() async {
    try {
      final data = await getOrderScreenRepo.getPromotionalItems() ?? [];
      promotionalProducts = data;
    } catch (e) {
      showError = true;
    }
    notifyListeners();
  }
}
