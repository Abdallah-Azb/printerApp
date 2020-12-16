import 'package:flutter/cupertino.dart';

import 'model_data_api.dart';

class FavoriteModel extends ChangeNotifier {
  List<Data> favoriteProduct = [];

  AddProductToFavorite(Data value) {
    favoriteProduct.add(value);
    notifyListeners();
  }

  DeleteProductFromFavorite(Data value) {
    favoriteProduct.remove(value);
    notifyListeners();
  }
}
