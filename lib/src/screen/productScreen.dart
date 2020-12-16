import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/src/help_style/font_style.dart';
import 'package:untitled2/src/model/cart_model.dart';
import 'package:untitled2/src/model/favoret_model.dart';
import 'package:untitled2/src/model/model_data_api.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  static String id = "productScreen";

  @override
  Widget build(BuildContext context) {
    Data product = ModalRoute.of(context).settings.arguments;
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: heightScreen * 0.85,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: heightScreen * 0.3,
                          width: widthScreen,
                          //   color: Colors.yellow[100],
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                height: heightScreen * 0.2,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Image.network(
                                    product.images[0].images,
                                  ),
                                ),
                              ),
                              Container(
                                  height: heightScreen * 0.1,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: product.images.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Image.network(
                                          product.images[index].images,
                                          fit: BoxFit.fill,
                                        ),
                                      );
                                    },
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            color: Colors.deepOrange[700],
                            onPressed: () {
                              try {
                                Navigator.pop(context);
                              } catch (ex) {
                                print(ex.toString());
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.modelName.toString(),
                        style: GoogleFonts.walterTurncoat(
                            color: Colors.deepOrange[900]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 1),
                              decoration: BoxDecoration(
                                  color: Colors.yellow[300],
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text("description".tr))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        product.description.toString(),
                        maxLines: 8,
                        style: Antic(),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: widthScreen,
                      color: Colors.deepOrange[800],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(product.size.toString(),
                                style:
                                    TextStyle(color: Colors.deepOrange[900])),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 1),
                                    decoration: BoxDecoration(
                                        color: Colors.yellow[300],
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text("size print".tr))),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: widthScreen,
                      color: Colors.deepOrange[800],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(product.checkTimes.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.deepOrange[900])),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 1),
                                    decoration: BoxDecoration(
                                        color: Colors.yellow[300],
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text("chick time".tr))),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: widthScreen,
                      color: Colors.deepOrange[800],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 1),
                              decoration: BoxDecoration(
                                  color: Colors.yellow[300],
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text("features".tr))),
                    ),
                    Container(
                      height: heightScreen * 0.4,
                      child: ListView.builder(
                        itemCount: product.features.length,
                        itemBuilder: (context, index) {
                          return Wrap(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: AutoSizeText(
                                  " " +
                                      (index + 1).toString() +
                                      " ) " +
                                      product.features[index].feature
                                          .toString(),
                                  maxLines: 2,
                                ),
                              ),
                              Divider(
                                height: heightScreen * 0.05,
                                color: Colors.yellow[900],
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Builder(
                  builder: (context) => Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      height: heightScreen * 0.06,
                      width: widthScreen * 0.85,
                      child: AnimatedButton(
                        text: "add to cart".tr,
                        color: Colors.yellow[900],
                        pressEvent: () {
                          AwesomeDialog(
                            context: context,
                            btnOkText: "add".tr,
                            btnCancelText: "changed my mind".tr,
                            width: widthScreen * 0.8,
                            buttonsBorderRadius:
                                BorderRadius.all(Radius.circular(2)),
                            headerAnimationLoop: false,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'good choice'.tr,
                            desc: 'are you sure added this print'.tr,
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              try {
                                Provider.of<CartModel>(context, listen: false)
                                    .AddProductToCart(product);
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content:
                                      Text("success to add print to cart".tr),
                                  elevation: 2.0,
                                  backgroundColor: Colors.deepOrange[900],
                                ));
                              } catch (ex) {
                                print(ex.toString());
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text(ex.toString())));
                              }
                            },
                          )..show();
                        },
                      ),
                    ),
                  ),
                ),
                Builder(
                  builder: (context) => IconButton(
                      onPressed: () {
                        try {
                          Provider.of<FavoriteModel>(context, listen: false)
                              .AddProductToFavorite(product);
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content:
                                Text("success to add print to favorite".tr),
                            backgroundColor: Colors.deepOrange[900],
                          ));
                        } catch (ex) {
                          print(ex.toString());
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red[800],
                        size: 30,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
