import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

class AfterSplash extends StatelessWidget {
  static String id = "afterspash";

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow[100],
        elevation: 0.0,
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
            height: heightScreen * 0.5,
            decoration: BoxDecoration(
                color: Colors.yellow[100],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2.0,
                  )
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: (Radius.circular(80.0)),
                    bottomRight: (Radius.circular(80.0)))),
            child: CarouselSlider(
              options: CarouselOptions(
                height: heightScreen * 0.3,
                autoPlay: true,
                aspectRatio: 1.5,
                enlargeCenterPage: true,
              ),
              items: [
                Container(
                    margin: EdgeInsets.all(5.0),
                    //     color: Colors.orange,
                    child: Card(
                      color: Colors.yellow[200],
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Stack(
                          children: [
                            Image.asset("images/1.png"),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "نعدك بكل ما يلزمك",
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 20),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.all(5.0),
                    //     color: Colors.orange,
                    child: Card(
                      color: Colors.yellow[200],
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Stack(
                          children: [
                            Image.asset("images/2.png"),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "يتوفر لدينا جميع الطابعات",
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 20),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.all(5.0),
                    //     color: Colors.orange,
                    child: Card(
                      color: Colors.yellow[200],
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Stack(
                          children: [
                            Image.asset("images/3.png"),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "دعم فني دوري مجاني",
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 20),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
              child: Container(
            child: Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.id);
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: Colors.yellow[800],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        color: Colors.yellow[800],
                        onPressed: () {
                          Get.updateLocale(Locale("en"));
                          Get.to(HomeScreen());
                        },
                        child: Text("English"),
                      ),
                      RaisedButton(
                        color: Colors.yellow[800],
                        onPressed: () {
                          Get.updateLocale(Locale("ar"));
                          Get.to(HomeScreen());
                        },
                        child: Text("العربية"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      )),
    );
  }
}
