import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/src/model/cart_model.dart';
import 'package:untitled2/src/model/favoret_model.dart';
import 'package:untitled2/src/provider/bottom_provider_navigaror.dart';
import 'package:untitled2/src/provider/modal_hud.dart';
import 'package:untitled2/src/screen/after_splash_screen.dart';
import 'package:untitled2/src/screen/cart_screen.dart';
import 'package:untitled2/src/screen/favorite_Screen.dart';
import 'package:untitled2/src/screen/home.dart';
import 'package:untitled2/src/screen/productScreen.dart';
import 'package:untitled2/src/screen/search_screen.dart';
import 'package:untitled2/src/screen/splash_screen.dart';
import 'package:untitled2/src/screen/take_info_user.dart';
import 'package:untitled2/utlis_langs/tranlation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationBottomProvider>(
          create: (context) => NavigationBottomProvider(),
        ),
        ChangeNotifierProvider<CartModel>(
          create: (context) => CartModel(),
        ),
        ChangeNotifierProvider<ModalHud>(
          create: (context) => ModalHud(),
        ),
        ChangeNotifierProvider<FavoriteModel>(
          create: (context) => FavoriteModel(),
        ),
      ],
      child: GetMaterialApp(
        translations: Translation(),
        locale: Locale("ar"),
        fallbackLocale: Locale("en"),
        initialRoute: SplashScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          ProductScreen.id: (context) => ProductScreen(),
          CartScreen.id: (context) => CartScreen(),
          SearchScreen.id: (context) => SearchScreen(),
          FavoriteScreen.id: (context) => FavoriteScreen(),
          TakeInfoUser.id: (context) => TakeInfoUser(),
          AfterSplash.id: (context) => AfterSplash(),
          SplashScreen.id: (context) => SplashScreen(),
        },
      ),
    );
  }
}
