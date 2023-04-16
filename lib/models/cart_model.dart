import 'package:flutter/material.dart';
import 'package:shop_app/models/item_model.dart';

class CartModel extends ChangeNotifier {
  List<Item> items = [];

  void addCart(Item item) {
    items.add(item);
    notifyListeners();
  }

  void removeCart(int index) {
    items.removeAt(index);
    notifyListeners();
  }

  double total() {
    double total = 0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }
}
