import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/src/model/favoret_model.dart';
import 'package:untitled2/src/model/model_data_api.dart';
import 'package:untitled2/src/provider/bottom_provider_navigaror.dart';
import 'package:untitled2/src/screen/home.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  static String id = "favoriteScreen";

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    List<Data> product = Provider.of<FavoriteModel>(context).favoriteProduct;
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.yellow[100],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.deepOrange[700],
          onPressed: () {
            try {
              Navigator.pushNamed(context, HomeScreen.id);
            } catch (ex) {
              print(ex.toString());
            }
          },
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
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
          return ListView.builder(
            itemCount: product.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: Container(
                height: heightScreen * 0.3,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10),
                              child: Text(product[index].brandName.toString(),
                                  style: GoogleFonts.wellfleet(
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        "type of print".tr,
                                        style: TextStyle(fontSize: 16),
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
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                              product[index].images[0].images,
                              height: heightScreen * 0.12,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.yellow[100],
                                ),
                                padding: EdgeInsets.all(2),
                                width: widthScreen * 0.5,
                                child: AutoSizeText(
                                  product[index].modelName.toString(),
                                  maxLines: 2,
                                  style: GoogleFonts.aladin(fontSize: 17),
                                )),
                          )
                        ],
                      ),
                      Container(
                        width: widthScreen * 0.6,
                        height: heightScreen * 0.06,
                        //     color: Colors.purple,
                        child: GestureDetector(
                          onTap: () {
                            try {
                              EasyDialog(
                                  //   cardColor: Colors.yellow[100],
                                  title: Text(
                                    "remove from favorite".tr,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textScaleFactor: 1.2,
                                  ),
                                  description: Text(
                                    product[index].modelName,
                                    textScaleFactor: 1.1,
                                    textAlign: TextAlign.center,
                                  ),
                                  topImage: AssetImage(
                                    "images/del.gif",
                                  ),
                                  height: 350,
                                  contentList: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        new FlatButton(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          textColor: Colors.lightBlue,
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: new Text(
                                            "cancel".tr,
                                            textScaleFactor: 1.2,
                                          ),
                                        ),
                                        new FlatButton(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          textColor: Colors.lightBlue,
                                          onPressed: () {
                                            try {
                                              Provider.of<FavoriteModel>(
                                                      context,
                                                      listen: false)
                                                  .DeleteProductFromFavorite(
                                                      product[index]);
                                              Navigator.of(context).pop();
                                            } catch (ex) {
                                              print(ex.toString());
                                            }
                                          },
                                          child: new Text(
                                            "yes i agree",
                                            textScaleFactor: 1.2,
                                            style: TextStyle(
                                                color: Colors.red[700]),
                                          ),
                                        ),
                                      ],
                                    )
                                  ]).show(context);
                            } catch (ex) {
                              print(ex.toString());
                            }
                          },
                          child: Container(
                            width: widthScreen * 0.4,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.deepOrange[400],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: Text("remove from cart".tr)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Text("eroro");
      }),
      //******** this the NavigationBar *******
      bottomNavigationBar: Container(
        height: heightScreen * 0.078,
        child: BottomNavigationBar(
          iconSize: 19,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          fixedColor: Colors.deepOrange[700],
          backgroundColor: Colors.yellow[400],
          currentIndex: Provider.of<NavigationBottomProvider>(context).indexBar,
          onTap: (value) {
            Provider.of<NavigationBottomProvider>(context, listen: false)
                .onclick(value, context);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: ""),
          ],
        ),
      ),
    );
  }
}
