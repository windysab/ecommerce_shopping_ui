import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_shopping_ui/common/global_variables.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: GlobalVariables.bannerImages.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Builder(
              builder: (BuildContext context) => Image.network(
                i,
                fit: BoxFit.contain,
                height: 200,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
