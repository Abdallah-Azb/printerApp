import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/src/screen/cart_screen.dart';
import 'package:untitled2/src/screen/favorite_Screen.dart';
import 'package:get/get.dart';

class MakeDrawer extends StatefulWidget {
  @override
  _MakeDrawerState createState() => _MakeDrawerState();
}

class _MakeDrawerState extends State<MakeDrawer> {
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    return Drawer(
      elevation: 20.0,
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Image.asset(
                  'images/giphy.gif',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            decoration: BoxDecoration(color: Colors.white),
          ),
          //  SizedBox(width: 5.0,),
          Container(
            //  color: Colors.deepOrange,
            height: heightScreen * 0.47,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            size: 28,
                            color: Color(0xffFFCA37),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "home main".tr,
                            style: TextStyle(
                                color: Color(0xff505050), fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //   SizedBox(width: 5.0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CartScreen.id);
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('images/shopping-bagy.png'),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "cart".tr,
                            style: TextStyle(
                                color: Color(0xff505050), fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //   SizedBox(width: 5.0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, FavoriteScreen.id);
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.favorite,
                            size: 28,
                            color: Color(0xffFFCA37),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "favorite".tr,
                            style: TextStyle(
                                color: Color(0xff505050), fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //   SizedBox(width: 5.0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      //     Navigator.push(context, MaterialPageRoute(builder: (context)=>WikipediaExplorer(url: 'http://p-prent.com/',)));
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('images/internet.png'),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "web side".tr,
                            style: TextStyle(
                                color: Color(0xff505050), fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //   SizedBox(width: 5.0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>WikipediaExplorer(url: 'http://p-prent.com/about',)));
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('images/info.png'),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "about us".tr,
                            style: TextStyle(
                                color: Color(0xff505050), fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //   SizedBox(height: MediaQuery.of(context).size.height/4,),
              ],
            ),
          ),

          Container(
            //   color: Colors.purpleAccent,
            height: heightScreen * 0.1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "buy print".tr,
                style: GoogleFonts.walterTurncoat(
                    color: Color(0xffFFCA37), fontSize: 20.0),
              ),
            ),
          ),
          Container(
            //  color: Colors.deepOrangeAccent,
            height: heightScreen * 0.1,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "  By/ Abdallah Azab@A_H  ",
                style: GoogleFonts.pacifico(
                    color: Colors.orange[900], fontSize: 5.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
