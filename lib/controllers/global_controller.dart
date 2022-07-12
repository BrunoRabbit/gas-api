import 'package:flutter/material.dart';
import 'package:gas_api/data/cart_list.dart';

class GlobalController extends ChangeNotifier {
  // CombustivelModel newCombustivelModel;
  // var authId;

  // void getAuthId(String id) {
  //   authId = id;
  //   notifyListeners();
  // }

  void addItem(Object item) {
    cartList.add(item);
    notifyListeners();
  }

  void deleteItem(int id) {
    cartList.removeAt(id);
    notifyListeners();
  }
}
