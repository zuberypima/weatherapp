import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/tips/cloud1.png',
  'assets/tips/cloud2.png',
  'assets/tips/cloud3.png',
  'assets/tips/cloud4.png',
  'assets/tips/cloud5.png',
];

final themeMode = ValueNotifier(2);

class StrongWindTps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: true,
              pageSnapping: true,
              autoPlay: true,
            ),
            items: imgList
                .map((item) => Container(
                      child: Center(
                          child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        height: height,
                      )),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
