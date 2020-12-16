import 'package:flutter/material.dart';
import 'package:untitled2/src/screen/favorite_Screen.dart';
import 'package:untitled2/src/screen/home.dart';

class NavigationBottomProvider extends ChangeNotifier {
  int indexBar = 0;

  onclick(int value, context) {
    indexBar = value;
    if (value == 0) {
      try {
        Navigator.pushNamed(context, HomeScreen.id);
      } catch (ex) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("حدث خطا ما" + ex.message.toString()),
          backgroundColor: Colors.yellow[300],
          padding: EdgeInsets.all(1.0),
          elevation: 2.0,
        ));
        print(ex.toString() +
            "الخطا دا في NavigationBar ==>> NavigationBar_bottom_provider");
      }
    }

    if (value == 1) {
      try {
        Navigator.pushNamed(context, FavoriteScreen.id);
      } catch (ex) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("حدث خطا ما" + ex.message.toString()),
          backgroundColor: Colors.yellow[300],
          padding: EdgeInsets.all(1.0),
          elevation: 2.0,
        ));
        print(ex.toString() +
            "الخطا دا في NavigationBar ==>> NavigationBar_bottom_provider");
      }
    }

    notifyListeners();
  }
}
