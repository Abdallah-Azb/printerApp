import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget(
      {Key key,
      @required this.heightScreen,
      @required this.widthScreen,
      @required this.image1,
      @required this.image2,
      @required this.image3})
      : super(key: key);

  final double heightScreen;

  final double widthScreen;

  final String image1, image2, image3;

  @override
  Widget build(BuildContext context) {
    Widget buildItem(
      String image,
    ) {
      return Padding(
        padding: const EdgeInsets.all(0.5),
        child: Center(
          child: Image.asset(
            image,
            height: heightScreen * 0.25,
            width: widthScreen * 0.8,
          ),
        ),
      );
    }

    return Carousel(
      images: [
        buildItem(image1),
        buildItem(image2),
        buildItem(image3),
      ],
      borderRadius: true,
      radius: Radius.circular(5),
      boxFit: BoxFit.fill,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
      dotSize: 5.0,
      dotIncreasedColor: Colors.yellow[900],
      dotBgColor: Colors.transparent,
      dotPosition: DotPosition.bottomCenter,
      dotVerticalPadding: 10.0,
      showIndicator: true,
      indicatorBgPadding: 6.0,
      // ************************  this will be true ********
      autoplay: true,
    );
  }
}
