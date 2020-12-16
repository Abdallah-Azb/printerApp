import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/src/model/cart_model.dart';
import 'package:untitled2/src/model/model_data_api.dart';
import 'package:untitled2/src/screen/take_info_user.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  static String id = "cartScreen";

  @override
  Widget build(BuildContext context) {
    List<Data> product = Provider.of<CartModel>(context).productData;
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (product.isEmpty) {
                return Container(
                  height: heightScreen,
                  child: Center(
                    child: Image.asset(
                      "images/cart_empty.jpg",
                      width: widthScreen * 0.6,
                    ),
                  ),
                );
              }
              if (product.isNotEmpty) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.yellow[800],
                      ),
                    ),
                    Container(
                      height: heightScreen * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: product.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: heightScreen * 0.4,
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0, vertical: 10),
                                            child: Text(
                                                product[index]
                                                    .brandName
                                                    .toString(),
                                                style: GoogleFonts.pacifico(
                                                    fontSize: 18,
                                                    color: Colors
                                                        .deepOrange[900])),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5,
                                                            vertical: 1),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.yellow[300],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Text(
                                                      "type of print".tr,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ))),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Card(
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Image.network(
                                            product[index].images[0].images,
                                            height: heightScreen * 0.12,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                color: Colors.yellow[100],
                                              ),
                                              padding: EdgeInsets.all(2),
                                              width: widthScreen * 0.5,
                                              child: AutoSizeText(
                                                product[index]
                                                    .modelName
                                                    .toString(),
                                                maxLines: 2,
                                                style: GoogleFonts.amiko(),
                                              )),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0, vertical: 10),
                                            child: Text(
                                                product[index].size.toString(),
                                                style:
                                                    GoogleFonts.walterTurncoat(
                                                        fontSize: 18,
                                                        color: Colors
                                                            .deepOrange[900])),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5,
                                                            vertical: 1),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.yellow[300],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Text(
                                                      "size of print".tr,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ))),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: widthScreen,
                                      height: heightScreen * 0.06,
                                      //     color: Colors.purple,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              try {
                                                Provider.of<CartModel>(context,
                                                        listen: false)
                                                    .DeleteProductFromCart(
                                                        product[index]);
                                              } catch (ex) {
                                                print(ex.toString());
                                              }
                                            },
                                            child: Container(
                                              width: widthScreen * 0.4,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5),
                                              decoration: BoxDecoration(
                                                color: Colors.deepOrange[400],
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                      "remove from cart".tr)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Container(
                                              // height: heightScreen * 0.08,
                                              width: widthScreen * 0.4,
                                              child: AnimatedButton(
                                                text: "order print".tr,
                                                color: Colors.yellow[900],
                                                pressEvent: () {
                                                  AwesomeDialog(
                                                    context: context,
                                                    btnOkText:
                                                        "complete application"
                                                            .tr,
                                                    btnCancelText:
                                                        "changed my mind again"
                                                            .tr,
                                                    width: widthScreen * 0.8,
                                                    buttonsBorderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(2)),
                                                    headerAnimationLoop: false,
                                                    animType:
                                                        AnimType.BOTTOMSLIDE,
                                                    title: 'buy'.tr,
                                                    desc:
                                                        'are you sure buy this print'
                                                            .tr,
                                                    btnCancelOnPress: () {},
                                                    btnOkOnPress: () {
                                                      try {
                                                        Navigator.pushNamed(
                                                            context,
                                                            TakeInfoUser.id,
                                                            arguments:
                                                                product[index]);
                                                      } catch (ex) {
                                                        print(ex.toString());
                                                      }
                                                    },
                                                  )..show();
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
