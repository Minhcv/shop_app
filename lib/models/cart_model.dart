import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shop_app/models/item_model.dart';

class CartModel extends ChangeNotifier {
  List<Item> items = [];

  void addCart(Item item) {
    items.add(item);
    notifyListeners();
  }

  void removeCart(String id) {
    items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  String total() {
    double total = 0;
    for (var item in items) {
      total += item.price;
    }
    return total.toStringAsFixed(2);
  }

  String sumPriceById(String id) {
    double total = 0;
    for (var item in items) {
      if (id == item.id) {
        total += item.price;
      }
    }
    return total.toStringAsFixed(2);
  }

  int itemAmount(String id) {
    int itemAmount = 0;
    for (var item in items) {
      if (id == item.id) {
        itemAmount++;
      }
    }
    return itemAmount;
  }

  Set<Item> itemsSet() {
    return Set<Item>.from(items);
  }
}
