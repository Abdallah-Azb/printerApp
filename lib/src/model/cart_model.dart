import 'package:flutter/cupertino.dart';

import 'model_data_api.dart';

class CartModel extends ChangeNotifier {
  List<Data> productData = [];

  AddProductToCart(Data value) {
    productData.add(value);
    notifyListeners();
  }

  DeleteProductFromCart(Data value) {
    productData.remove(value);
    notifyListeners();
  }
}
