import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/src/help_style/font_style.dart';
import 'package:untitled2/src/provider/bottom_provider_navigaror.dart';
import 'package:untitled2/src/screen/productScreen.dart';
import 'package:untitled2/src/screen/search_screen.dart';
import 'package:untitled2/src/sercices/fetch_data_api.dart';
import 'package:untitled2/src/widget/carousel_images_home.dart';
import 'package:untitled2/src/widget/product_item_home.dart';
import 'package:get/get.dart';
import 'cart_screen.dart';
import 'drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = "homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var d = AllData();

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      drawer: MakeDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState.openDrawer();
            },
            child: Icon(
              Icons.menu,
              size: 30,
              color: Colors.yellow,
            )),
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, CartScreen.id),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: Colors.yellow,
              ),
            ),
          )
        ],
        centerTitle: true,
        title: InkWell(
            onTap: () {
              Navigator.pushNamed(context, SearchScreen.id);
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3.5),
                width: MediaQuery.of(context).size.width * 3.5,
                decoration: BoxDecoration(
                  color: Colors.yellow[400],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "search for favorite product".tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.search)
                  ],
                ),
              ),
            )),
      ),
      body: FutureBuilder(
          future: d.fetchDataFromAPI(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.yellow[700],
              ));
            }
            if (snapshot.hasData == false) {
              return Center(
                child: Container(
                  height: heightScreen * 0.5,
                  width: widthScreen * 0.5,
                  child: Image.asset(
                    "images/no.png",
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Container(
                  height: heightScreen * 0.9,
                  width: widthScreen * 0.9,
                  child: Image.asset(
                    "images/no.png",
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }

            if (snapshot.hasData) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // ***** the Carousel Images ****
                    Container(
                      height: heightScreen * 0.251,
                      child: CarouselWidget(
                        heightScreen: heightScreen,
                        widthScreen: widthScreen,
                        image1: "images/image1.jpg",
                        image2: "images/image2.gif",
                        image3: "images/image3.jpg",
                      ),
                    ),

                    // *******  the first Row of list Product type Canon ******
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "more".tr,
                            style: TextStyle(color: Colors.yellow[900]),
                          ),
                          Text(
                            "prints canon".tr,
                            style: ST_Walter(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: heightScreen * 0.27,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, ProductScreen.id,
                                  arguments: d.data.data[index]);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: ProductItem(
                                name: d.data.data[index].modelName.toString(),
                                size: d.data.data[index].size
                                    .toString()
                                    .toUpperCase(),
                                image: d.data.data[index].images[0].images,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // ****  the Space ****
                    SizedBox(
                      height: heightScreen * 0.05,
                    ),

                    // *******  the Second Row of list Product type Richo ******
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "more".tr,
                            style: TextStyle(color: Colors.yellow[900]),
                          ),
                          Text("prints Richo".tr, style: ST_Walter())
                        ],
                      ),
                    ),
                    Container(
                      height: heightScreen * 0.26,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 16,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, ProductScreen.id,
                                  arguments: d.data.data[index + 12]);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: ProductItem(
                                name: d.data.data[index + 12].modelName
                                    .toString(),
                                size: d.data.data[index + 12].size
                                    .toString()
                                    .toUpperCase(),
                                image: d.data.data[index + 12].images[0].images,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // ****  the Space ****
                    SizedBox(
                      height: heightScreen * 0.05,
                    ),

                    // *******  the Third Row of list Product type Hp ******
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "more".tr,
                            style: TextStyle(color: Colors.yellow[900]),
                          ),
                          Text("prints hp".tr, style: ST_Walter()),
                        ],
                      ),
                    ),
                    Container(
                      height: heightScreen * 0.27,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 11,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, ProductScreen.id,
                                  arguments: d.data.data[index + 28]);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: ProductItem(
                                name: d.data.data[index + 28].modelName
                                    .toString(),
                                size: d.data.data[index + 28].size
                                    .toString()
                                    .toUpperCase(),
                                image: d.data.data[index + 28].images[0].images,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // ****  the Space ****
                    SizedBox(
                      height: heightScreen * 0.05,
                    ),
                  ],
                ),
              );
            }

            return CircularProgressIndicator();
          }),
      // ***************** this is NavigationBar *******************
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
            try {
              Provider.of<NavigationBottomProvider>(context, listen: false)
                  .onclick(value, context);
            } catch (ex) {
              print(
                  ex.toString() + "الخطا دا في NavigationBar ==>> home Screen");
            }
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
    ));
  }
}
