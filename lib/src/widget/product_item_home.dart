import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/src/help_style/font_style.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  final String image;

  final String name, size;

  ProductItem({@required this.image, @required this.name, @required this.size});

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        padding: EdgeInsets.all(0.1),
        height: heightScreen * 0.27,
        width: widthScreen * 0.39,
        color: Colors.white70,
        //   color: Colors.blueAccent,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double hight = constraints.maxHeight;
            double width = constraints.maxWidth;
            return Card(
              margin: EdgeInsets.all(1.0),
              shadowColor: Colors.black,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                    child: Image.network(
                      image,
                      fit: BoxFit.fill,
                      height: hight * 0.5,
                      width: width,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      //     color: Colors.red,

                      //    height: hight*0.35,
                      child: AutoSizeText(
                        name,
                        maxLines: 2,
                        minFontSize: 12,
                        maxFontSize: 13,
                        style: ST_Pacifico(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(1),

                          decoration: BoxDecoration(
                              color: Colors.yellow[300],
                              borderRadius: BorderRadius.circular(3.0)),

                          //  height: hight*0.15,
                          child: AutoSizeText(
                            size,
                            maxLines: 1,
                            minFontSize: 11,
                            maxFontSize: 12,
                          ),
                        ),
                        Text(
                          "Size".tr,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
